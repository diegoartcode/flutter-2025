void main() {
  var m1 = new Moto();
  print(m1.marca);
  print(Moto().marca);
  Moto().ligar();
  print(Moto().estaAndando());
}

class Moto {
  String cor = 'Preto';
  String marca = 'Suzuki';
  String modelo = 'Intruder';
  int cilindrada = 250;

  void ligar() {
    print('ligou!');
  }

  bool estaAndando() {
    return false;
  }
}
