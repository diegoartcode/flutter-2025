import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  String? error;

  void _login() {
    final user = _userController.text;
    final pass = _passController.text;

    print(user);
    print(pass);

    if (AuthService.login(user, pass)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen(username: user)),
      );
    } else {
      setState(() {
        error = 'Usuário ou senha inválidos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Text(
                'Entrar',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              TextField(
                controller: _userController,
                decoration: InputDecoration(labelText: 'Usuário'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passController,
                decoration: InputDecoration(labelText: 'Senha'),
              ),
              if (error != null) ...[
                SizedBox(height: 10),
                Text(error!, style: TextStyle(color: Colors.red)),
              ],
              SizedBox(height: 20),
              ElevatedButton(onPressed: _login, child: Text('Entrar')),
            ],
          ),
        ),
      ),
    );
  }
}
