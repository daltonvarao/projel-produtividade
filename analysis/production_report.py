#%%
import psycopg2
from dotenv import load_dotenv
import os
from sshtunnel import SSHTunnelForwarder
from psycopg2.extras import DictCursor
import pandas as pd
import numpy as np

load_dotenv(r'.\dados.env',override=True)

def get_connection_using_ssh_tunnel():
    with SSHTunnelForwarder(
        (os.getenv('SSH_HOST'), int(os.getenv('SSH_PORT'))),
        ssh_username=os.getenv('SSH_USER'),
        ssh_password=os.getenv('SSH_PASSWORD'),
        remote_bind_address=(os.getenv('DB_HOST'), int(os.getenv('DB_PORT'))),
        local_bind_address=('localhost', 5441)
    ) as server:

        server.start()

        conn = psycopg2.connect(
            dbname=os.getenv('DB_NAME'),
            user=os.getenv('DB_USER'),
            password=os.getenv('DB_PASSWORD'),
            host=server.local_bind_host,
            port=server.local_bind_port,
            sslmode='disable'
        )

        return conn

def get_connect_using_psycopg2():



    conn = psycopg2.connect(
        dbname=os.getenv('DB_NAME'),
        user=os.getenv('DB_USER'),
        password=os.getenv('DB_PASSWORD'),
        host=os.getenv('DB_HOST'),
        port=os.getenv('DB_PORT'),
        sslmode='disable'
    )

    return conn

def execute_query(query):
    print('obtendo conexao')
    conn = get_connect_using_psycopg2()
    print('obtendo cursor')
    cursor = conn.cursor(cursor_factory=DictCursor)
    print('executando query')
    cursor.execute(query)
    print('obtendo dados')
    data = cursor.fetchall()
    print('fechando cursor')
    conn.close()

    results_as_dict = [dict(result) for result in data]

    return results_as_dict



def main(nome_do_feather = None):

    def carregar_do_feather():
        df = pd.read_feather(nome_do_feather)
        return df

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
          inicio='2023-12-21',
          fim='2024-01-20',
          contrato=1
      )

      data = execute_query(sql)

      df = pd.DataFrame(data)

      return df

    df = carregar_do_banco() if nome_do_feather is None else carregar_do_feather()

    return df

df = main(nome_do_feather='contrato-1-2023-12-21-2024-01-20.feather')

df['funcionario'] = df['funcionario'].apply(lambda x: x.strip())
# df = main()

df




#%%

def gerar_memoria_de_calculo_por_funcionario(nome_funcionario):

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

def gerar_resumo_memoria_completo():
  resumo_memoria_por_funcionario = []

  for funcionario in df['funcionario'].unique():
      resumo_memoria_por_funcionario.append(
          (funcionario, gerar_memoria_de_calculo_por_funcionario(funcionario))
      )

  resumo_memoria_completo = pd.concat([x[1] for x in resumo_memoria_por_funcionario],axis=0)

  return resumo_memoria_completo

def exportar_resumo_memoria_para_excel(resumo_memoria):
  resumo_memoria['quantidade'] = resumo_memoria_completo['quantidade'].astype(str).str.replace('.',',')

  resumo_memoria['valor_unitario'] = resumo_memoria_completo['valor_unitario'].astype(str).str.replace('.',',')

  resumo_memoria['sub_total'] = resumo_memoria_completo['sub_total'].astype(str).str.replace('.',',')

  resumo_memoria['total_geral'] = resumo_memoria_completo['total_geral'].astype(str).str.replace('.',',')

  resumo_memoria['total_geral'] = resumo_memoria['total_geral'].str.replace('nan','')

  resumo_memoria.to_excel('resumo_memoria_completo.xlsx')

#%%

resumo_memoria_completo = gerar_resumo_memoria_completo()

exportar_resumo_memoria_para_excel(resumo_memoria_completo)




