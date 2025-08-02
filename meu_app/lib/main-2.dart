import 'package:flutter/material.dart';

void main() => runApp(MeuApp());

// funções (Widgets)
// - StatelessWidget: não muda de estado, é imutável
// - StateFulWidget: pode mudar de estado, é mutável
// - InheritedWidget: Usado para compartilhar dados entre widgets

class MeuApp extends StatelessWidget{
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context){    
    return const Text(
      'Olá mundo!!!!', 
      textDirection: TextDirection.ltr,
    );
  }
}
