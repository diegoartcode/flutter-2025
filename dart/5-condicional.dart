import 'dart:io';


void main(){
  int num1 = 0;
  int num2 = 0;

  if(num1 > num2){
    print('$num1 é maior que $num2');
  }else if(num1 < num2){
    print('$num1 é menor que $num2');
  }else if(num1 == 0 || num2 == 0){
    print('$num1 é igual a zero');
  }else{
    print('$num1 é igual $num2');
  }

  String pais = 'Brasil';
  int idade = 18;
  
  if(pais == 'Brasil'){
    print('Você é brasileiro');
    if(idade >= 18){
      print('Você é maior de idade');
    }else{
      print('Você é menor de idade');
    }
  }else{
    print('Você e estrangeiro');
  }

  // 3 notas 
  // calcular media 
  // mostrar media

  // media é maior ou igual a 7.0 
  // aluno aprovado

  // media é maior ou igual a 5.0 
  // aluno em recuperação

  // aluno reprovado
  
  print('Digite a primeira nota: ');
  double nota1 = double.parse(stdin.readLineSync()!);
  print('Digite a segunda nota: ');
  double nota2 = double.parse(stdin.readLineSync()!);
  print('Digite a terceira nota: ');
  double nota3 = double.parse(stdin.readLineSync()!);

  double media = (nota1 + nota2 + nota3) / 3;
    
  if(media >= 7.0){
    print('Aluno aprovado');
  }else if(media >= 5.0){
     print('Aluno em recuperação');
  }else{
    print('Aluno reprovado');
  }

  print('fim');


  // switch case

  int dia = 6;
  int semana = 0;
  switch(dia){
    case 1:
    print('Domingo');
    case 2:
    print('Segunda');
    case 3:
    print('Terça');
    case 4:
    print('Quarta');
    case 5:
    print('Quinta');
    case 6 when semana < 1:
    print('Sexta');
    case 7:
    print('Sabado');
    default:
    print('Entrada de dados invalido!');
  }
}