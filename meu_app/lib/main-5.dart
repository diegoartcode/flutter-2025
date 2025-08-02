import 'package:flutter/material.dart';

void main() => runApp(const MeuApp());

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Titulo do app'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Olá mundo',
                style: TextStyle(
                  fontSize: 50
                ),
                ),

                SizedBox(height: 20),

                Icon(Icons.favorite, color: Colors.pink, size: 40),

                SizedBox(height: 20),

                Image.network('https://picsum.photos/200', width: 300, height: 300),

                SizedBox(height: 20),

                ElevatedButton(onPressed: (){
                  print('Botão pressionado');
                },
                child: Text('Clique aqui!'),                
                ),

                 SizedBox(height: 20),

                ElevatedButton(onPressed: (){
                  print('Botão pressionado');
                },
                child: Text('Clique aqui!'),                
                ),


            ],
          ),
        ),
      ),
    );
  }
}

