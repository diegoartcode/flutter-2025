import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(TemporizadorApp());

class TemporizadorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronômetro / Temporizador',
      theme: ThemeData(primarySwatch: Colors.red),
      home: TimerPage(),
    );
  }
}

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Timer? _timer;
  int _tempo = 0;
  bool _ativo = false;
  bool _modoRegressivo = false;

  int _tempoInicialRegressivo = 10; // segundos padrão para regressivo

  void _iniciar() {
    if (_ativo) return;
    setState(() {
      _ativo = true;
      if (_modoRegressivo) {
        _tempo = _tempoInicialRegressivo;
      } else {
        _tempo = 0;
      }
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_modoRegressivo) {
          if (_tempo > 0) {
            _tempo--;
          } else {
            _parar();
          }
        } else {
          _tempo++;
        }
      });
    });
  }

  void _parar() {
    _timer?.cancel();
    setState(() {
      _ativo = false;
    });
  }

  void _reiniciar() {
    _parar();
    setState(() {
      _tempo = _modoRegressivo ? _tempoInicialRegressivo : 0;
    });
  }

  String _formatarTempo(int segundos) {
    final minutos = (segundos ~/ 60).toString().padLeft(2, '0');
    final segs = (segundos % 60).toString().padLeft(2, '0');
    return '$minutos:$segs';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cronômetro / Temporizador'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatarTempo(_tempo),
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _iniciar, child: Text('Iniciar')),
                SizedBox(width: 16),
                ElevatedButton(onPressed: _parar, child: Text('Parar')),
                SizedBox(width: 16),
                ElevatedButton(onPressed: _reiniciar, child: Text('Reiniciar')),
              ],
            ),
            SizedBox(height: 40),
            Divider(),
            SwitchListTile(
              title: Text(
                _modoRegressivo
                    ? 'Modo: Temporizador (Regressivo)'
                    : 'Modo: Cronômetro (Progressivo)',
              ),
              value: _modoRegressivo,
              onChanged: (value) {
                setState(() {
                  _modoRegressivo = value;
                  _tempo = _modoRegressivo ? _tempoInicialRegressivo : 0;
                });
              },
            ),
            if (_modoRegressivo)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Duração: "),
                  DropdownButton<int>(
                    value: _tempoInicialRegressivo,
                    items: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120]
                        .map(
                          (seg) => DropdownMenuItem<int>(
                            child: Text('$seg s'),
                            value: seg,
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _tempoInicialRegressivo = value;
                          _tempo = value;
                        });
                      }
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
