void main(){
  var p1 = new Produto(nome: 'Fonte 12v', preco: 50.55);
  var p2 = new Produto(nome: 'Notebook',preco: 4259.99);
  var p3 = new Produto(preco: 250.40, nome: 'Teclado');
  var p4 = new Produto(nome: 'Monitor');
  var p5 = new Produto(nome: 'Monitor', preco: 500.55);

  print(p1.nome);
  print(p1.preco);
  print(p2.nome);
  print(p2.preco);

  print('Nome produto: ${p1.nome} | Preço: ${p1.preco} ');
  print('Nome produto: ${p2.nome} | Preço: ${p2.preco} ');
  print('Nome produto: ${p3.nome} | Preço: ${p3.preco} ');
  print('Nome produto: ${p4.nome} | Preço: ${p4.preco} ');
  print('Nome produto: ${p5.nome} | Preço: ${p5.preco} ');
}

class Produto{
  String? nome;
  double? preco;  

  Produto({this.nome,this.preco = 9.99});// metodo construtor com parametros nomeados
}
