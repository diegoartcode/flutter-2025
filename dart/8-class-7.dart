void main() {
 var gato = new Gato();
 gato.fazerSom();
}

class Animal{
  void fazerSom(){
    print('Som genérico de animal');
  }
}

class Gato extends Animal{
  @override // A anotação @override em Dart é usada para indicar que você está sobrescrevendo (redefinindo) um método que já existe em uma class pai (ou interface).

  void fazerSom(){
    print('Miau');
  }
}



