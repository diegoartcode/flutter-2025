import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const PerfilApp());



class PerfilApp extends StatelessWidget {
  const PerfilApp({super.key});

  void _abrirTelefone() async {
    final Uri url = Uri(scheme: 'tel', path: '+551199999-9999');
    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }
    print('Telefone');
  }

  void _abrirEmail() async{
    final Uri url = Uri(
      scheme: 'mailto',
      path: 'seuemail@email.com',
      query: 'subject=Contato&body=Olá, Diego',
    );

    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }
    print('Email');
  }

  void _abrirEndereco() async{
    final Uri url = Uri.parse('https://www.google.com/maps/place/Senac+Lapa+Tito/@-23.5280859,-46.6917602,17z/data=!4m6!3m5!1s0x94cef8775663b04f:0x923835e9005f8309!8m2!3d-23.5280859!4d-46.6917602!16s%2Fg%2F1tf7htl9?entry=ttu&g_ep=EgoyMDI1MDczMC4wIKXMDSoASAFQAw%3D%3D');

    if(await canLaunchUrl(url)){
      await launchUrl(url);
    }
    print('Endereço');
  }

  void _abrirWatsapp() async{
     final Uri url = Uri.parse('https://wa.me/551199999999?text=Olá%20Diego');
     if(await canLaunchUrl(url)){
      await launchUrl(url);
    }
    print('whatsapp');
  }


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perfil do usuário'),
          backgroundColor: Colors.red,
        ),
      backgroundColor: const Color.fromARGB(255, 192, 151, 151),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            SizedBox(height: 16),
            Text(
              "Diego Rodrigues",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "Programador",
              style: TextStyle(
                color: const Color.fromARGB(255, 59, 59, 59),
                fontSize: 16
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ 
                IconButton(
                  icon: const Icon(Icons.phone, color: const Color.fromARGB(255, 255, 51, 0) ),
                  onPressed: _abrirTelefone,
                ),  
                IconButton(
                  icon: const Icon(Icons.email, color: const Color.fromARGB(255, 255, 51, 0) ),
                  onPressed: _abrirEmail,

                ),
                IconButton(
                  icon: const Icon(Icons.location_city, color: const Color.fromARGB(255, 255, 51, 0) ),
                  onPressed: _abrirEndereco,
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.whatsapp, color: const Color.fromARGB(255, 255, 51, 0)),
                  onPressed: _abrirWatsapp,
                ),  


                // Icon(Icons.phone, color: const Color.fromARGB(255, 255, 51, 0)),
                // Icon(Icons.email, color:const Color.fromARGB(255, 255, 51, 0)),
                // Icon(Icons.location_city, color:const Color.fromARGB(255, 255, 51, 0)),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}

