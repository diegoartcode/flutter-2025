import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget{
  const SegundaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Segunda tela teste")),
      body: Center(
        child: ElevatedButton(
          child: Text('Voltar'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

