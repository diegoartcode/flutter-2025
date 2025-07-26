void main(){
  // dynamic: tipo flexível, mas perigoso se não for bem usado

  dynamic valor = 'Olá mundo';
  print(valor);

  valor = 100;
  print(valor);

  // null safety: variaveis que podem ou não ser nulas 

  String? nome;

  print(nome);

  nome = "Diego";
  print(nome);

  // late: inicialização tardia (após a declaração)
  late String saudacao;
  saudacao = 'Bom dia';
  print(saudacao);

}