import 'package:flutter/material.dart';


void main() => runApp(RotasDados());

class RotasDados extends StatelessWidget {
  const RotasDados({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App rotas com dados',
      home: TelaBoasvindas(),
    );
  }
}

class TelaBoasvindas extends StatelessWidget{
  const TelaBoasvindas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bem-vindo')),
      body: Center(
        child: ElevatedButton(
          child: Text('Começar'),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TelaCadastro()),
            );
          }
        ),
      ),
    );
  }

}

class TelaCadastro extends StatefulWidget{
  const TelaCadastro({super.key});

  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro>{
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Digite seu nome: '),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _idadeController,
              decoration: InputDecoration(labelText: 'Digite sua idade: '),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              child: Text('Cadastrar'), 
              onPressed: (){
                String nome = _nomeController.text;
                String idade = _idadeController.text;

                if(nome.isNotEmpty && idade.isNotEmpty){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TelaPerfil(nome: nome, idade: idade)),
                  );
                  print(nome);
                  print(idade);
                }else{
                  print('Digite todos os campos');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Preencha todos os campos")),
                  );
                }
              }
              ),
          ],
        ),
        ),
    );
  }
 
}


class TelaPerfil extends StatelessWidget{
  final String nome;
  final String idade;

  const TelaPerfil({super.key, required this.nome, required this.idade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Perfil")),
      body: Center(child: Column(
        children: [
          Text('nome $nome - Idade $idade')
        ],
      ),),

    );
  }
}