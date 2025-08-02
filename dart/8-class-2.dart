void main(){
  var p1 = new Produto('Fonte 12v',50.55);
  var p2 = new Produto('Notebook',50.55);

  print(p1.nome);
  print(p1.preco);
  print(p2.nome);
  print(p2.preco);

  print('Nome produto: ${p1.nome} | Preço: ${p1.preco} ');
  print('Nome produto: ${p2.nome} | Preço: ${p2.preco} ');
}


class Produto{
  String? nome;
  double? preco;  

  // Produto(String nome, double preco){
  //   print('classe inicializada');
  //   this.nome = nome;
  //   this.preco = preco;
  // }

  Produto(this.nome,this.preco);// metodo construtor com parametros direcional
}
