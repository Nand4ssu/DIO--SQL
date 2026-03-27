import pandas as pd 

# Extração (EXTRACT)

df = pd.read_csv("dados.csv")
#df é onde os dados ficam guardados: DataFrame

print(df.head())
#Mostra as primeiras linhas da tabela.

# Transformação (TRANSFORMAÇÃO)

def gerar_mensagem(professor):
    return f"Olá {professor}, boas aulas hoje!"

df["mensagem"] = df["professor"].apply(gerar_mensagem)

# Carregamento (LOAD)
df.to_csv("resultado.csv", index=False)
#Index = False: não salvar aquela coluna de números.
