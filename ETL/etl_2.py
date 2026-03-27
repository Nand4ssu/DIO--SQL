# Atividade 2!
# Desafio: Ler uma linha com produto, quantidade e valor unitário separados por vírgula,
# calcular o valor total da venda (quantidade * valor) e exibir no formato "produto: total".



# Leitura da linha de entrada
entrada = input().strip()

# Extração (separar os dados)
produto, quantidade, valor = entrada.split(',')

# Transformação (converter e calcular)
quantidade = int(quantidade)
valor = int(valor)
total = quantidade * valor

# Carregamento (saída formatada)
print(f"{produto}: {total}")