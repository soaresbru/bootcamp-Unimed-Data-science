def leiadinheiro(g):
    global l
    l=g
    while True:
        r = str(l).replace(',', '.').strip()
        if r.isalpha():
            l=input('Erro, digite novamente')

        else:

            f=float(r)
            return f

