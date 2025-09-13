import 'package:flutter/material.dart';
import '../mock/mock_db.dart';
import '../models/exercicio.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    List<Exercicio> lista = mockDB.getExerciciosPara(username);

    return Scaffold(
      appBar: AppBar(title: Text('Meus Exercícios'), centerTitle: true),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          final ex = lista[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 2,
            child: ListTile(
              title: Text(ex.nome, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${ex.series} séries de ${ex.repeticoes} respetições\n${ex.observacoes}'),
              
            ),
          );
        },
      ),
    );
  }
}
