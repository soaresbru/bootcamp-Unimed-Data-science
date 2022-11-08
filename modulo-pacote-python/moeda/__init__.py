def aumentar(a,b):
    k=a*(1+(b/100))
    return formata(k)

def diminuir(a,b):
    k=a*(1-(b/100))
    return formata(k)

def dobro(a):
    k=a*2
    return formata(k)

def metade(a):
    k=a/2
    return formata(k)

def formata(a,b='R$ '):
    return f'{b} {a:.2f}'

def resumo(a,b,c):
    print('*************************')
    print('   Resumo do Valor')
    print('*************************')
    print(f'o dobro é: \t\t\t{dobro(a)}')
    print(f'a metade é: \t\t{metade(a)} ')
    print(f'acrescimo de {b}% é: {aumentar(a,b)} ')
    print(f'desconto de {c}% é: \t{diminuir(a,c)}')

