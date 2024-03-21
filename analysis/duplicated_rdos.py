#%%
import pandas as pd
from psycopg2.extras import DictCursor
import psycopg2
from dotenv import load_dotenv
import os

load_dotenv(r'.\dados.env',override=True)

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



def carregar_ids_rdos(data,nome,user_id,equipamento_id,estrutura_id):
    sql = f"""
        select r.id
        from rdos r
        where r."data" = '{data}'
        and r.nome = '{nome}'
        and r.user_id = {user_id}
        and r.equipamento_id = {equipamento_id}
        and r.estrutura_id = {estrutura_id}
    """.format(
        data=data,
        nome=nome,
        user_id=user_id,
        equipamento_id=equipamento_id,
        estrutura_id=estrutura_id
    )

    data = execute_query(sql)

    df = pd.DataFrame(data)

    return df

def main(nome_do_feather = None):
    def carregar_do_feather():
        df = pd.read_feather(nome_do_feather)
        return df

    def carregar_do_banco():
      sql = """
          select r."data" , r.nome , r.user_id , r.equipamento_id , r.estrutura_id , count(*)
          from rdos r
          group by r."data" , r.nome , r.user_id , r.equipamento_id , r.estrutura_id
          having count(*) > 1
          order by r.data
      """

      data = execute_query(sql)

      df = pd.DataFrame(data)

      return df

    df = carregar_do_banco() if nome_do_feather is None else carregar_do_feather()



    return df

def teste():
    data = "2024-01-15"
    nome = "15.01.2024 - 1T - PJL-012 - BARRAGEM SUL SUPERIOR"
    user_id = 342
    equipamento_id = 107
    estrutura_id = 107
    

df = main()

df
