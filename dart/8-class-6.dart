void main() {
  var a1 = new Animal();

  // a1.dormir();

  var dog1 = new Cachorro();
  dog1.latir();
  dog1.dormir();
}

class Animal{
  void dormir(){
    print('O animal está dormindo');
  }
}

class Cachorro extends Animal{
  void latir(){
    print('O cachorro está latindo!');
  }
}

