# Atividade 3
# Implemente um programa que leia uma string contendo nomes de clientes separados por vírgula e espaço.

# Lê a linha de entrada contendo nomes separados por vírgula e espaço
entrada = input()

nomes = entrada.split(",")
nomes_tratados = []

for nome in nomes:
  nome_limpo = nome.strip() # remove os espaços 
  nome_maiusculo = nome_limpo.upper() # deixa maisuculo
  nomes_tratados.append(nome_maiusculo)
  
resultado = "; ".join(nomes_tratados) # junta tudo no formato solicitado 

# Exemplo de saída esperada: 'ANA; BRUNO; CARLA'
print(resultado)