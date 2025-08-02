import 'package:flutter/material.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget{
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context){    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Meu primeiro APP'),
          backgroundColor: Colors.blue,
        ),
        body: Center( 
          child: Text('Olá mundo!!', 
          style: TextStyle(fontSize: 50, color: Color.fromARGB(255, 56, 56, 108)),
          ),
        ),
      ),
    );
  }
}