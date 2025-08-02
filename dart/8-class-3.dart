void main(){
  var p1 = new Produto(nome: 'Fonte 12v', preco: 50.55);
  var p2 = new Produto(nome: 'Notebook',preco: 4259.99);
  var p3 = new Produto(preco: 250.40, nome: 'Teclado');

  print(p1.nome);
  print(p1.preco);
  print(p2.nome);
  print(p2.preco);

  print('Nome produto: ${p1.nome} | Preço: ${p1.preco} ');
  print('Nome produto: ${p2.nome} | Preço: ${p2.preco} ');
  print('Nome produto: ${p3.nome} | Preço: ${p3.preco} ');
}

class Produto{
  String? nome;
  double? preco;  

  Produto({this.nome,this.preco});// metodo construtor com parametros nomeados
}
