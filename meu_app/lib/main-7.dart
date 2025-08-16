import 'package:flutter/material.dart';

void main() {
  runApp(const ColunasLinhas());
}

class ColunasLinhas extends StatelessWidget {
  const ColunasLinhas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Linha e colunas'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
       child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(width: 200, height: 200, color: Colors.amber),
                SizedBox(height: 16),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Text(
                    "Card largo",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),

                SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 105,
                      width: 105,
                      color: Colors.deepOrangeAccent,
                      child: Center(
                        child: Text(
                          'card 1',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 105,
                      width: 105,
                      color: Colors.deepOrangeAccent,
                      child: Center(
                        child: Text(
                          'card 2',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 105,
                      width: 105,
                      color: Colors.deepOrangeAccent,
                      child: Center(
                        child: Text(
                          'card 3',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 120,
                        color: Colors.deepPurple,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Card Adicional',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  // Ação para o botão
                                },
                                child: Text('Ação'),
                              ),
                              Row(children: [Text('Ação'), Text('Ação')]),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: 120,
                        color: Colors.deepPurple,
                        child: Container(child: Text('Card Adicional')),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Text(
                    "Card largo",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Text(
                    "Card largo",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Text(
                    "Card largo",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Text(
                    "Card largo",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
