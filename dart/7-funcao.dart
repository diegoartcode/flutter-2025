void main(){
  escreva();
  
  
  soma(10,5, 'Diego');

  soma(1,100, 'Jhenny');

  print(retornaNome());
  print(retornaSoma(10,30));

  print(retornaNomeIdade());
  print(retornaNomeIdade().$1);
  print(retornaNomeIdade().$2);
}

void escreva(){
  print('Olá mundo! ');
  print(retornaNomeIdade());
}

void soma(int num1,int num2, String nome){ 
  print('soma: $num1 + $num2 = ${num1 + num2} - $nome');
}

String retornaNome(){
  return "Maria";
}

int retornaSoma(int num1,int num2){
  int soma = num1 + num2;
  return soma;
}

(String, int) retornaNomeIdade(){
  return ('Diego', 33);
}

String texto1(){
  return 'Aqui o texto esta retornando com arrow function';
}

String texto() => 'Aqui o texto esta retornando com arrow function';