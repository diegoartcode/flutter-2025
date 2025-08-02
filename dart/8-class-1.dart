void main(){
  var p1 = new Produto();

  String nome = p1.nome = "Fonte 12v";
  double preco = p1.preco = 50.55;
  

  print('Produto: $nome \nPreço: R\$$preco');
}


class Produto{
  String? nome;
  double? preco;  
}
