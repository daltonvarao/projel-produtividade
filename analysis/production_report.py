#%%

#region importacoes
import psycopg2
from dotenv import load_dotenv
import os
from sshtunnel import SSHTunnelForwarder
from psycopg2.extras import DictCursor
import pandas as pd
import numpy as np
import sys
#endregion

#%%
#region funcoes
def get_connect_using_psycopg2(
      dbname, user, password, host, port, sslmode = 'disable'
):



    # conn = psycopg2.connect(
    #     dbname=os.getenv('DB_NAME'),
    #     user=os.getenv('DB_USER'),
    #     password=os.getenv('DB_PASSWORD'),
    #     host=os.getenv('DB_HOST'),
    #     port=os.getenv('DB_PORT'),
    #     sslmode='disable'
    # )

    conn = psycopg2.connect(
        dbname=dbname,
        user=user,
        password=password,
        host=host,
        port=port,
        sslmode=sslmode
    )

    return conn

def execute_query(dbname, user, password, host, port, query):

    conn = get_connect_using_psycopg2(
       dbname,user,password,host,port
    )

    cursor = conn.cursor(cursor_factory=DictCursor)

    cursor.execute(query)

    data = cursor.fetchall()

    conn.close()

    results_as_dict = [dict(result) for result in data]

    return results_as_dict

def carregar_atividades_funcionarios(
      dbname, user, password, host, port, initialDate, finalDate, contractId
):
  sql = """
    select u.nome as funcionario , c.titulo as cargo, r."data" , a.descricao  as atividade, f.nome as furo, ar.quantidade
    from atividade_rdos ar
    inner join rdo_users ru on ru.rdo_id  = ar.rdo_id
    inner join rdos r on r.id = ar.rdo_id
    inner join atividades a on a.id = ar.atividade_id
    inner join furos f on f.id = ar.furo_id
    inner join users u on u.id = ru.user_id
    inner join cargos c on c.id  = u.cargo_id
    where a.tipo  = 'produtiva'
    and r."data" between '{initialDate}' and '{finalDate}'
    and r.contrato_id = {contractId}
    and f.invalid  is false
    order by u.nome, r.data, a.descricao , f.nome
    """.format(
      initialDate=initialDate,
      finalDate=finalDate,
      contractId=contractId
    )

  data = execute_query(dbname, user, password, host, port, sql)

  df = pd.DataFrame(data)

  return df


def carregar_dados_resumo_memoria(
      dbname,
      user,
      password,
      host,
      port,
      initialDate,
      finalDate,
      contractId,
):



    def carregar_do_banco():
      sql = """
          select  u.nome as funcionario, r.data , c.titulo as cargo , a.descricao as atividade , f.nome as furo , ar.quantidade , acv.valor_unitario
          from atividade_rdos ar
          inner join rdo_users ru on ru.rdo_id  = ar.rdo_id
          inner join rdos r on r.id = ar.rdo_id
          inner join atividades a on a.id = ar.atividade_id
          inner join furos f on f.id = ar.furo_id
          inner join users u on ru.user_id  = u.id
          inner join cargos c on c.id = u.cargo_id
          inner join atividade_cargo_valores acv on acv.cargo_id  = u.cargo_id and acv.atividade_id = ar.atividade_id
          where r."data" between '{inicio}' and '{fim}'
          and a.tipo  = 'produtiva'
          and r.contrato_id = {contrato}
          and f.invalid is false
          order by u.nome , r."data" , a.descricao , f.nome
      """.format(
          inicio=initialDate,
          fim=finalDate,
          contrato=contractId
      )

      data = execute_query(dbname, user,password,host,port, sql)

      df = pd.DataFrame(data)

      return df

    df = carregar_do_banco()

    df['funcionario'] = df['funcionario'].apply(lambda x: x.strip())
    df['quantidade'] = df['quantidade'].astype(float)
    df['valor_unitario'] = df['valor_unitario'].astype(float)


    return df


def gerar_memoria_de_calculo_por_funcionario(df, nome_funcionario):

  df_funcionario = df[df['funcionario'] == nome_funcionario]

  df_funcionario_agregado = df_funcionario.pivot_table(
      index = ['funcionario', 'cargo', 'atividade'],
      values=['quantidade', 'valor_unitario'],
      aggfunc='sum'
  )

  df_funcionario_agregado['sub_total'] = df_funcionario_agregado['quantidade'] * df_funcionario_agregado['valor_unitario']


  def gerar_total_geral(df):
      s = pd.Series(np.nan, index=df.index)

      s[0] = df['sub_total'].sum()

      return s

  df_funcionario_agregado['total_geral'] = gerar_total_geral(df_funcionario_agregado)

  return df_funcionario_agregado

def gerar_atividades_por_funcionario(df,nome_funcionario):
  df_funcionario = df[df['funcionario'] == nome_funcionario]

  df_funcionario_agregado = df_funcionario.pivot_table(
      index = ['funcionario', 'data', 'atividade', 'furo'],
      values = ['quantidade']
  )

  return df_funcionario_agregado

def gerar_dfs_atividades_por_funcionario(df):

  dfs = []

  for funcionario in df['funcionario'].unique():
      dfs.append(
          (funcionario, gerar_atividades_por_funcionario(df, funcionario))
      )

  return dfs


def gerar_resumo_memoria_completo(dbname, user, password,host,port, initialDate, finalDate, contractId):
  resumo_memoria_por_funcionario = []

  df = carregar_dados_resumo_memoria(dbname, user, password, host, port, initialDate,finalDate,contractId)

  for funcionario in df['funcionario'].unique():
      resumo_memoria_por_funcionario.append(
          (funcionario, gerar_memoria_de_calculo_por_funcionario(df, funcionario))
      )

  resumo_memoria_completo = pd.concat([x[1] for x in resumo_memoria_por_funcionario],axis=0)

  return resumo_memoria_completo

def exportar_para_excel(resumo_memoria_completo, atividades_por_funcionario, arquivo_saida):

  def ajustar_resumo_memoria_completo():
    resumo_memoria_completo['quantidade'] = resumo_memoria_completo['quantidade'].astype(str).str.replace('.',',')

    resumo_memoria_completo['valor_unitario'] = resumo_memoria_completo['valor_unitario'].astype(str).str.replace('.',',')

    resumo_memoria_completo['sub_total'] = resumo_memoria_completo['sub_total'].astype(str).str.replace('.',',')

    resumo_memoria_completo['total_geral'] = resumo_memoria_completo['total_geral'].astype(str).str.replace('.',',')

    resumo_memoria_completo['total_geral'] = resumo_memoria_completo['total_geral'].str.replace('nan','')

    return resumo_memoria_completo

  writer = pd.ExcelWriter(arquivo_saida, engine='xlsxwriter')

  resumo_memoria_completo = ajustar_resumo_memoria_completo()

  resumo_memoria_completo.to_excel(writer, sheet_name='Resumo Memória')

  indice_planilha = 1

  for nome_funcionario, df_atividades in atividades_por_funcionario:
    nome_planilha = nome_funcionario.split()[0] + f"_{indice_planilha}"

    df_atividades.to_excel(writer, sheet_name=nome_planilha)

    indice_planilha += 1

  writer.close()

def executando_no_jupyter():
  return 'get_ipython' in globals()

def executando_como_script():
   return not executando_no_jupyter()

def executar_como_script():
    import argparse

    parser = argparse.ArgumentParser()

    parser.add_argument('--initialDate', required=True)
    parser.add_argument('--finalDate', required=True)
    parser.add_argument('--contractId', required=True)
    parser.add_argument('--dbname', required=True)
    parser.add_argument('--user', required=True)
    parser.add_argument('--password', required=True)
    parser.add_argument('--host', required=True)
    parser.add_argument('--port', required=True)
    parser.add_argument('--target-excel-file', required=True)

    args = parser.parse_args()

    if os.path.exists(args.target_excel_file):
       os.unlink(args.target_excel_file)

    resumo_memoria_completo = gerar_resumo_memoria_completo(
        dbname=args.dbname,
        user=args.user,
        password=args.password,
        host=args.host,
        port=args.port,
        initialDate=args.initialDate,
        finalDate=args.finalDate,
        contractId=args.contractId
    )

    atividades_funcionarios = carregar_atividades_funcionarios(
        dbname=args.dbname,
        user=args.user,
        password=args.password,
        host=args.host,
        port=args.port,
        initialDate=args.initialDate,
        finalDate=args.finalDate,
        contractId=args.contractId
    )

    dfs_atividades_por_funcionario = gerar_dfs_atividades_por_funcionario(atividades_funcionarios)  

    exportar_para_excel(resumo_memoria_completo, dfs_atividades_por_funcionario, args.target_excel_file)
#%%

if executando_no_jupyter():
    load_dotenv(r'.\dados.env',override=True)

    print(os.getenv('DB_NAME'))
    print(os.getenv('DB_USER'))
    print(os.getenv('DB_PASSWORD'))
    print(os.getenv('DB_HOST'))
    print(os.getenv('DB_PORT'))
   

    resumo_memoria_completo = gerar_resumo_memoria_completo(
        dbname=os.getenv('DB_NAME'),
        user=os.getenv('DB_USER'),
        password=os.getenv('DB_PASSWORD'),
        host=os.getenv('DB_HOST'),
        port=os.getenv('DB_PORT'),
        initialDate='2023-12-21',
        finalDate='2024-01-20',
        contractId=1

    )

    resumo_memoria_completo

#endregion   

#%%

if executando_no_jupyter():
  load_dotenv(r'.\dados.env',override=True)

  initialDate = '2023-12-21'
  finalDate = '2024-01-20'
  contractId = 1

  resumo_memoria_completo = gerar_resumo_memoria_completo(
    dbname=os.getenv('DB_NAME'),
    user=os.getenv('DB_USER'),
    password=os.getenv('DB_PASSWORD'),
    host=os.getenv('DB_HOST'),
    port=os.getenv('DB_PORT'),
    initialDate=initialDate,
    finalDate=finalDate,
    contractId=contractId
  )

  atividades_funcionarios = carregar_atividades_funcionarios(
    dbname=os.getenv('DB_NAME'),
    user=os.getenv('DB_USER'),
    password=os.getenv('DB_PASSWORD'),
    host=os.getenv('DB_HOST'),
    port=os.getenv('DB_PORT'),
    initialDate=initialDate,
    finalDate=finalDate,
    contractId=contractId
  )

  dfs_atividades_por_funcionario = gerar_dfs_atividades_por_funcionario(atividades_funcionarios)

  #%%

  exportar_para_excel(resumo_memoria_completo, dfs_atividades_por_funcionario, 'resumo_memoria_completo.xlsx')

#%%

if executando_como_script():
   executar_como_script()
