void main(){
  // operadores aritméticos

  int num1 = 10;
  int num2 = 5;

  int soma = num1 + num2; // adição
  print(soma);

  int subtracao =  num1 - num2; //subtração
  print(subtracao);

  int multiplicacao = num1 * num2; // multiplicação
  print(multiplicacao);

  double divisao = num1 / num2; // divisão
  print(divisao);

  int modulo = num1 % num2; // módulo (resto de uma divisão)
  print(modulo);

  // operadores relacionais

  // == igualdade 
  // != diferente
  // > maior que
  // < menor que
  // <= menor igual
  // >= maior igual
  
  int a = 10;
  int b = 5;

  bool igualdade = a == b;
  print(igualdade);

  bool diferente = a != b;
  print(diferente);

  bool menorQue = a < b;
  print(menorQue);

  bool maiorQue = a > b;
  print(maiorQue);

  bool menorOuIgual = a <= b;
  print('---');
  print('menorOuIgual $menorOuIgual');
  print('---');
  bool maiorOuIgual = a >= b;
  print('maiorOuIgual: $maiorOuIgual');
}