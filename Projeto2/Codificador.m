function Si = Codificador(symbol)
a=1.8;
b=-2.1;

switch symbol
case 0
      Si=b;
case 1
      Si=0;
case 2
      Si =a;
otherwise
        error('Sinal enviado não corresponde a 0,1 ou 2');
end 
        