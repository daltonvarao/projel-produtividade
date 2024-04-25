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

def converter_para_float(valor):
    try:
        return float(valor)
    except:
        return np.nan

def carregar_atividades_colaboradores(
      dbname, user, password, host, port, initialDate, finalDate, contractId
):
  sql = """
    select u.nome as colaborador , c.titulo as cargo, r."data" , a.descricao  as atividade, f.nome as furo, ar.quantidade
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
          select  u.nome as colaborador, r.data , c.titulo as cargo , a.descricao as atividade , f.nome as furo , ar.quantidade , acv.valor_unitario
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

    if df.empty:
      return df


    df['colaborador'] = df['colaborador'].apply(lambda x: x.strip())
    df['quantidade'] = df['quantidade'].astype(float)
    df['valor_unitario'] = df['valor_unitario'].astype(float)


    return df


def gerar_memoria_de_calculo_por_colaborador(df, nome_colaborador):

  df_colaborador = df[df['colaborador'] == nome_colaborador]

  df_colaborador_agregado = df_colaborador.pivot_table(
      index = ['colaborador', 'cargo', 'atividade'],
      values=['quantidade', 'valor_unitario'],
      aggfunc={
          'quantidade': 'sum',
          'valor_unitario': 'first'
      }
  )

  df_colaborador_agregado['sub_total'] = df_colaborador_agregado['quantidade'] * df_colaborador_agregado['valor_unitario']


  def gerar_total_geral(df):
      s = pd.Series(np.nan, index=df.index)

      s[0] = df['sub_total'].sum()

      return s

  df_colaborador_agregado['total_geral'] = gerar_total_geral(df_colaborador_agregado)

  df_colaborador_agregado['total_geral'] = df_colaborador_agregado['total_geral'].apply(converter_para_float).apply(lambda x : round(x,2))

  return df_colaborador_agregado

def gerar_atividades_por_colaborador(df,nome_colaborador):
  df_colaborador = df[df['colaborador'] == nome_colaborador]

  df_colaborador_agregado = df_colaborador.pivot_table(
      index = ['colaborador', 'data', 'atividade', 'furo'],
      values = ['quantidade'],
      aggfunc='sum'
  )

  df_colaborador_agregado['quantidade'] = df_colaborador_agregado['quantidade'].apply(converter_para_float).apply(lambda x: round(x,2))

  return df_colaborador_agregado

def gerar_dfs_atividades_por_colaborador(df):

  dfs = []

  for colaborador in df['colaborador'].unique():
      dfs.append(
          (colaborador, gerar_atividades_por_colaborador(df, colaborador))
      )

  return dfs


def gerar_resumo_memoria_completo(dbname, user, password,host,port, initialDate, finalDate, contractId):
  resumo_memoria_por_colaborador = []

  df = carregar_dados_resumo_memoria(dbname, user, password, host, port, initialDate,finalDate,contractId)

  if df.empty:
     return df

  for colaborador in df['colaborador'].unique():
      resumo_memoria_por_colaborador.append(
          (colaborador, gerar_memoria_de_calculo_por_colaborador(df, colaborador))
      )

  resumo_memoria_completo = pd.concat([x[1] for x in resumo_memoria_por_colaborador],axis=0)



  return resumo_memoria_completo

def exportar_para_excel(resumo_memoria_completo, atividades_por_colaborador, arquivo_saida):

  def ajustar_resumo_memoria_completo():

    resumo_memoria_completo_copia = resumo_memoria_completo.copy()

    resumo_memoria_completo_copia['quantidade'] = resumo_memoria_completo_copia['quantidade'].round(2)

    resumo_memoria_completo_copia['quantidade'] = resumo_memoria_completo_copia['quantidade'].astype(str).str.replace('.',',')

    resumo_memoria_completo_copia['valor_unitario'] = resumo_memoria_completo_copia['valor_unitario'].astype(str).str.replace('.',',')

    resumo_memoria_completo_copia['sub_total'] = resumo_memoria_completo_copia['sub_total'].apply(converter_para_float).apply(lambda x: round(x,2))

    resumo_memoria_completo_copia['sub_total'] = resumo_memoria_completo_copia['sub_total'].astype(str).str.replace('.',',')

    resumo_memoria_completo_copia['total_geral'] = resumo_memoria_completo_copia['total_geral'].astype(str).str.replace('.',',')

    resumo_memoria_completo_copia['total_geral'] = resumo_memoria_completo_copia['total_geral'].str.replace('nan','')

    resumo_memoria_completo_copia = resumo_memoria_completo_copia.style.set_properties(**{'text-align': 'center'})

    return resumo_memoria_completo_copia

  def ajustar_df_atividades_por_colaborador(df):
    df['quantidade'] = df['quantidade'].round(2)

    df['quantidade'] = df['quantidade'].astype(str).str.replace('.',',')

    return df



  with pd.ExcelWriter(arquivo_saida, engine='xlsxwriter') as writer:

    resumo_memoria_completo = ajustar_resumo_memoria_completo()

    resumo_memoria_completo.to_excel(
       writer,
       sheet_name='Resumo Memória'
    )

    #resumo_memoria_completo.to_excel(writer, sheet_name='Resumo Memória')

    indice_planilha = 1

    for nome_colaborador, df_atividades in atividades_por_colaborador:
      nome_planilha = nome_colaborador.split()[0] + f"_{indice_planilha}"

      df_atividades_ajustado = ajustar_df_atividades_por_colaborador(df_atividades)

      df_atividades_ajustado.to_excel(writer, sheet_name=nome_planilha)

      indice_planilha += 1

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

    atividades_colaboradores = carregar_atividades_colaboradores(
        dbname=args.dbname,
        user=args.user,
        password=args.password,
        host=args.host,
        port=args.port,
        initialDate=args.initialDate,
        finalDate=args.finalDate,
        contractId=args.contractId
    )

    dfs_atividades_por_colaborador = gerar_dfs_atividades_por_colaborador(atividades_colaboradores)

    exportar_para_excel(resumo_memoria_completo, dfs_atividades_por_colaborador, args.target_excel_file)
#%%

if executando_no_jupyter():
   load_dotenv(r'.\dados.env',override=True)

   dados_resumo_memoria = carregar_dados_resumo_memoria(
        dbname=os.getenv('DB_NAME'),
        user=os.getenv('DB_USER'),
        password=os.getenv('DB_PASSWORD'),
        host=os.getenv('DB_HOST'),
        port=os.getenv('DB_PORT'),
        initialDate='2023-12-21',
        finalDate='2024-01-20',
        contractId=1

   )



#%%

if executando_no_jupyter():
    load_dotenv(r'.\dados.env',override=True)




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

  atividades_colaboradores = carregar_atividades_colaboradores(
    dbname=os.getenv('DB_NAME'),
    user=os.getenv('DB_USER'),
    password=os.getenv('DB_PASSWORD'),
    host=os.getenv('DB_HOST'),
    port=os.getenv('DB_PORT'),
    initialDate=initialDate,
    finalDate=finalDate,
    contractId=contractId
  )

  dfs_atividades_por_colaborador = gerar_dfs_atividades_por_colaborador(atividades_colaboradores)


  exportar_para_excel(resumo_memoria_completo, dfs_atividades_por_colaborador, 'resumo_memoria_completo.xlsx')

#%%

if executando_como_script():
   executar_como_script()
