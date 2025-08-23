import 'package:flutter/material.dart';

void main() {
  runApp(CurriculoApp());
}

class CurriculoApp extends StatelessWidget {
  const CurriculoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currículo',

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Currículo'),
          backgroundColor: Colors.grey[400],
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Container(
                      //   color: Colors.grey[400],
                      //   padding: EdgeInsets.all(16),
                      // width: double.infinity,
                      //   child: Center(
                      //     child: Text('Currículo'),
                      //   ),
                      // ),
                      SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        color: Colors.grey[300],
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          children: [
                            Text(
                              'Diego Rodrigues',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text('Desenvolvedor', textAlign: TextAlign.center),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            // Image.network(
                            //   'https://picsum.photos/200',
                            //   width: 150,
                            //   height: 150,
                            // ),

                            // CircleAvatar(
                            //   radius: 75,
                            //   backgroundImage: NetworkImage(
                            //     'https://picsum.photos/200',
                            //   ),
                            // ),
                            CircleAvatar(
                              radius: 75,
                              backgroundImage: AssetImage(
                                'assets/images/avatar.jpg',
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    color: Colors.grey[600],
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Bairro, Cidade, Estado',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),

                                  Container(
                                    width: double.infinity,
                                    color: Colors.grey[600],
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Bairro, Cidade, Estado',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    color: Colors.grey[600],
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Bairro, Cidade, Estado',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        color: Colors.grey[400],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              color: Colors.grey[600],
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Objetivo',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Aqui vai o objetivo',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        color: Colors.grey[400],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              color: Colors.grey[600],
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'FORMAÇÃO',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    color: Colors.grey[600],
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Escola x \n Data 00/00/00',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.grey[600],
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Escola x \n Data 00/00/00',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.grey[600],
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      'Escola x \n Data 00/00/00',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                       Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        color: Colors.grey[400],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              color: Colors.grey[600],
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'EXPERIÊNCIA',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    color: Colors.grey[600],
                                    margin: EdgeInsets.symmetric(vertical: 4),
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      'Cargo - 00/00/00 \n Nome empresa \n Aqui vai uma descrição do cargo',
                                      style: TextStyle(color: Colors.white, fontSize:16),
                                      
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
