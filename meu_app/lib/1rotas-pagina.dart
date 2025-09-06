import 'package:flutter/material.dart';
import '2primeira-tela.dart';

void main() => runApp(Rotas());

class Rotas extends StatelessWidget {
  const Rotas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraTela(),
    );
  }
}



