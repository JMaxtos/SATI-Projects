function symbol = FonteInformacao()
%Probabilidade de cada um dos símbolos
p = [1/3, 1/3, 1/3];
%Geracão de um simbolo
symbol = randsample(0:2, 1, true, p);
