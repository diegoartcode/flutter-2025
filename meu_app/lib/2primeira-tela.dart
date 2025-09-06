import 'package:flutter/material.dart';
import '3segunda-tela.dart';


class PrimeiraTela extends StatelessWidget{
    const PrimeiraTela({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Primeira tela teste')),
        body: Center(
          child: ElevatedButton(
            child: Text('Ir para segunda tela'), 
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SegundaTela()),
              );
            }
          ),
        ),
      );
  }
}
