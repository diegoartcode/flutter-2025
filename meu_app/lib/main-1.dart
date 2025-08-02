import 'package:flutter/material.dart';

// void main = ponto de partida do dart
void main(){
  // runApp = ponto de partida do flutter 
  runApp(
    const Text(
      'Olá mundo!',
      textDirection: TextDirection.rtl,
  ),
  );
}

/* 
O que são um widgets?
- Em flutter, tudo o que você ve na tela é um widget
- Um widget é um componente visual que faz parte da interface do app, como um texto, imagem, botão ou mesmo estrutura de layout.

Existem dois tipos de widgets:

1. Widgets de layout:
São responsáveis por organizar os elementos na tela.
Eles servem para 'estrutura' e podem conter outros widgets
Exemplo: Column, Row, Stack, ListView....

2. Widgets de interface:
São os elementos visuais que o usuario interage ou ve diretamente.
Exemplo: Text, Icon, Image, ElevatedButton.....

>>Dica: Os widgets podem ser combinados uns dentro dos outros.
Exemplo: Um Column pode conter vários Texts, Buttons, e assim por diante.
*/