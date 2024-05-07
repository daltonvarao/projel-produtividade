#%%

#region importacoes
import psycopg2
from dotenv import load_dotenv
import os
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
    select u.id as "ColaboradorId", u.nome as "Colaborador" , c.titulo as "Cargo", r."data" as "Data" , a.descricao as "Atividade", f.nome as "Furo", ar.quantidade as "Quantidade"
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
          select u.id as "ColaboradorId", u.nome as "Colaborador" , r.data as "Data" , c.titulo as "Cargo" , a.descricao as "Atividade" , f.nome as "Furo" , ar.quantidade as "Quantidade" , acv.valor_unitario as "Valor Unitário"
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


    df['Colaborador'] = df['Colaborador'].apply(lambda x: x.strip())
    df['Quantidade'] = df['Quantidade'].astype(float)
    df['Valor Unitário'] = df['Valor Unitário'].astype(float)


    return df


def gerar_memoria_de_calculo_por_colaborador(df, nome_colaborador):

  df_colaborador = df[df['Colaborador'] == nome_colaborador]

  df_colaborador_agregado = df_colaborador.pivot_table(
      index = ['ColaboradorId', 'Colaborador', 'Cargo', 'Atividade'],
      values=['Quantidade', 'Valor Unitário'],
      aggfunc={
          'Quantidade': 'sum',
          'Valor Unitário': 'first'
      }
  )

  df_colaborador_agregado['Subtotal'] = df_colaborador_agregado['Quantidade'] * df_colaborador_agregado['Valor Unitário']


  def gerar_total_geral(df):
      s = pd.Series(np.nan, index=df.index)

      s.iloc[0] = df['Subtotal'].sum()

      return s

  df_colaborador_agregado['Valor a pagar'] = gerar_total_geral(df_colaborador_agregado)

  df_colaborador_agregado['Valor a pagar'] = df_colaborador_agregado['Valor a pagar'].apply(converter_para_float).apply(lambda x : round(x,2))

  return df_colaborador_agregado

def gerar_atividades_por_colaborador(df,nome_colaborador):
  df_colaborador = df[df['Colaborador'] == nome_colaborador]

  df_colaborador_agregado = df_colaborador.pivot_table(
      index = ['Colaborador', 'Data', 'Atividade', 'Furo'],
      values = ['Quantidade'],
      aggfunc='sum'
  )

  df_colaborador_agregado['Quantidade'] = df_colaborador_agregado['Quantidade'].apply(converter_para_float).apply(lambda x: round(x,2))

  return df_colaborador_agregado

def gerar_dfs_atividades_por_colaborador(df):

  dfs = []

  for colaborador in df['Colaborador'].unique():
      dfs.append(
          (colaborador, gerar_atividades_por_colaborador(df, colaborador))
      )

  return dfs


def gerar_resumo_memoria_completo(dbname, user, password,host,port, initialDate, finalDate, contractId):
  resumo_memoria_por_colaborador = []

  df = carregar_dados_resumo_memoria(dbname, user, password, host, port, initialDate,finalDate,contractId)

  if df.empty:
     return df

  for colaborador in df['Colaborador'].unique():
      resumo_memoria_por_colaborador.append(
          (colaborador, gerar_memoria_de_calculo_por_colaborador(df, colaborador))
      )

  resumo_memoria_completo = pd.concat([x[1] for x in resumo_memoria_por_colaborador],axis=0)



  return resumo_memoria_completo

def exportar_para_excel(resumo_memoria_completo, atividades_por_colaborador, arquivo_saida, resumo_pagamento):

  def ajustar_resumo_memoria_completo():

    resumo_memoria_completo_copia = resumo_memoria_completo.copy()

    resumo_memoria_completo_copia['Quantidade'] = resumo_memoria_completo_copia['Quantidade'].round(2)

    resumo_memoria_completo_copia['Quantidade'] = resumo_memoria_completo_copia['Quantidade'].astype(str).str.replace('.',',')

    resumo_memoria_completo_copia['Valor Unitário'] = resumo_memoria_completo_copia['Valor Unitário'].astype(str).str.replace('.',',')

    resumo_memoria_completo_copia['Subtotal'] = resumo_memoria_completo_copia['Subtotal'].apply(converter_para_float).apply(lambda x: round(x,2))

    resumo_memoria_completo_copia['Subtotal'] = resumo_memoria_completo_copia['Subtotal'].astype(str).str.replace('.',',')

    resumo_memoria_completo_copia['Valor a pagar'] = resumo_memoria_completo_copia['Valor a pagar'].astype(str).str.replace('.',',')

    resumo_memoria_completo_copia['Valor a pagar'] = resumo_memoria_completo_copia['Valor a pagar'].str.replace('nan','')

    resumo_memoria_completo_copia = resumo_memoria_completo_copia.style.set_properties(**{'text-align': 'center'})

    return resumo_memoria_completo_copia

  def ajustar_df_atividades_por_colaborador(df):
    df['Quantidade'] = df['Quantidade'].round(2)

    df['Quantidade'] = df['Quantidade'].astype(str).str.replace('.',',')

    return df

  def ajustar_resumo_pagamento():
     resumo_pagamento_copia = resumo_pagamento.copy()

     return resumo_pagamento_copia

  with pd.ExcelWriter(arquivo_saida, engine='xlsxwriter') as writer:

    resumo_memoria_completo = ajustar_resumo_memoria_completo()

    resumo_pagamento = ajustar_resumo_pagamento()

    resumo_memoria_completo.to_excel(
       writer,
       sheet_name='Resumo Memória'
    )

    resumo_pagamento.to_excel(writer, sheet_name='Resumo Pagamento', index=False)

    def ajustar_worksheet_resumo_memoria( format_numbers, format_center):
      worksheet_resumo_memoria = writer.sheets['Resumo Memória']

      worksheet_resumo_memoria.set_column('D:D', None, format_numbers) #quantidade
      worksheet_resumo_memoria.set_column('D:D', None, format_center) #quantidade

      worksheet_resumo_memoria.set_column('E:E', None, format_numbers) #valor unitario
      worksheet_resumo_memoria.set_column('E:E', None, format_center) #valor unitario

      worksheet_resumo_memoria.set_column('F:F', None, format_numbers) #sub total
      worksheet_resumo_memoria.set_column('F:F', None, format_center) #sub total

      worksheet_resumo_memoria.set_column('G:G', None, format_numbers) #total geral
      worksheet_resumo_memoria.set_column('G:G', None, format_center) #total geral

      worksheet_resumo_memoria.autofit()



    def ajustar_worksheet_resumo_pagamento(format_numbers):
      worksheet_resumo_pagamento = writer.sheets['Resumo Pagamento']

      worksheet_resumo_pagamento.autofit()

      worksheet_resumo_pagamento.set_column('K:K', None, format_numbers) #valor a pagar

    workbook = writer.book


    format_numbers = workbook.add_format({'num_format': '#,##0.00'})

    format_center = workbook.add_format({'align': 'center'})

    ajustar_worksheet_resumo_memoria(format_numbers, format_center)

    ajustar_worksheet_resumo_pagamento(format_numbers)

    indice_planilha = 1

    for nome_colaborador, df_atividades in atividades_por_colaborador:
      nome_planilha = nome_colaborador.split()[0] + f"_{indice_planilha}"

      df_atividades_ajustado = ajustar_df_atividades_por_colaborador(df_atividades)

      df_atividades_ajustado.to_excel(writer, sheet_name=nome_planilha)

      indice_planilha += 1

def obter_resumo_pagamento_por_colaborador(colaboradorId, valorAPagar, user,password,host,port,dbname):
  sql = f"""
    select u.numero_cadastro as "Cadastro", u.nome as "Colaborador", c.titulo as "Cargo", u.cpf as "CPF", u.banco as "Banco", u.codigo_banco as "Código Banco", u.agencia as "Agência", u.conta as "Conta", u.pix as "PIX"
    from users u
    inner join cargos c on c.id = u.cargo_id
    where u.id = {colaboradorId}
  """

  data = execute_query(dbname,user,password,host,port,sql)

  df = pd.DataFrame(data)

  df['Valor a pagar'] = valorAPagar

  return df

def obter_resumo_pagamento(resumo_memoria_completo, user,password,host,port,dbname):

  resumos_pagamento = []

  resumo_memoria_completo_indice_resetado = resumo_memoria_completo.reset_index()

  for colaboradorId in resumo_memoria_completo_indice_resetado['ColaboradorId'].unique():
    resumos_pagamento.append(
      obter_resumo_pagamento_por_colaborador(
          colaboradorId=colaboradorId,
          valorAPagar=resumo_memoria_completo_indice_resetado[resumo_memoria_completo_indice_resetado['ColaboradorId'] == colaboradorId]['Valor a pagar'].iloc[0],
          user=user,
          password=password,
          host=host,
          port=port,
          dbname=dbname
      )
    )

  resumo_pagamento = pd.concat(resumos_pagamento, axis=0)

  resumo_pagamento.reset_index(drop=True, inplace=True)


  return resumo_pagamento

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

    resumo_pagamento = obter_resumo_pagamento(resumo_memoria_completo,
        user=args.user,
        password=args.password,
        host=args.host,
        port=args.port,
        dbname=args.dbname
    )

    exportar_para_excel(resumo_memoria_completo, dfs_atividades_por_colaborador, args.target_excel_file, resumo_pagamento)
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

  df_colaborador = dados_resumo_memoria[dados_resumo_memoria['Colaborador'] == 'Allan Henrique Hermogenes']

  df_colaborador_agregado = df_colaborador.pivot_table(
    index = ['ColaboradorId', 'Colaborador', 'Cargo', 'Atividade'],
    values=['Quantidade', 'Valor Unitário'],
    aggfunc={
        'Quantidade': 'sum',
        'Valor Unitário': 'first'
    }
  )

  df_colaborador_agregado['Subtotal'] = df_colaborador_agregado['Quantidade'] * df_colaborador_agregado['Valor Unitário']

  s = pd.Series(np.nan, index=df_colaborador_agregado.index)

  s.iloc[0] = df_colaborador_agregado['Subtotal'].sum()

  df_colaborador_agregado['Valor a pagar'] = s



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

  resumo_pagamento = obter_resumo_pagamento(resumo_memoria_completo,
    user=os.getenv('DB_USER'),
    password=os.getenv('DB_PASSWORD'),
    host=os.getenv('DB_HOST'),
    port=os.getenv('DB_PORT'),
    dbname=os.getenv('DB_NAME')

    )


  exportar_para_excel(resumo_memoria_completo, dfs_atividades_por_colaborador, 'resumo_memoria_completo.xlsx', resumo_pagamento)

#%%

if executando_no_jupyter():

   load_dotenv(r'.\dados.env',override=True)

   resumo_pagamento_por_colaborador = obter_resumo_pagamento_por_colaborador(
    colaboradorId=223,
    valorAPagar=1000,
    dbname=os.getenv('DB_NAME'),
    user=os.getenv('DB_USER'),
    password=os.getenv('DB_PASSWORD'),
    host=os.getenv('DB_HOST'),
    port=os.getenv('DB_PORT'),)

#%%
if executando_no_jupyter():
   load_dotenv(r'.\dados.env',override=True)

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

   resumo_pagamento = obter_resumo_pagamento(
      resumo_memoria_completo=resumo_memoria_completo,
      user=os.getenv('DB_USER'),
      password=os.getenv('DB_PASSWORD'),
      host=os.getenv('DB_HOST'),
      port=os.getenv('DB_PORT'),
      dbname=os.getenv('DB_NAME')
   )



#%%

if executando_como_script():
   executar_como_script()
