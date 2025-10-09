// Importa o pacote de Material Design do Flutter, que contém widgets e funcionalidades para criar interfaces.
import 'package:flutter/material.dart';

// Ponto de entrada do aplicativo. Executa a função runApp passando uma instância de MeuApp.
void main() => runApp(const MeuApp());

// Define a classe MeuApp como um widget sem estado (StatelessWidget).
class MeuApp extends StatelessWidget {
  // Construtor da classe MeuApp, com uma chave opcional para identificação do widget.
  const MeuApp({super.key});

  // Método que constrói a interface do aplicativo.
  @override
  Widget build(BuildContext context) {
    // Retorna um MaterialApp, que configura o aplicativo com tema e tela inicial.
    return MaterialApp(
      title: 'Flutter Componentes', // Define o título do aplicativo.
      theme: ThemeData(
        primarySwatch:
            Colors.indigo, // Define o tema primário como a cor indigo.
      ),
      home: const TelaCompleta(), // Define a tela inicial como TelaCompleta.
    );
  }
}

// Define a classe TelaCompleta como um widget com estado (StatefulWidget).
class TelaCompleta extends StatefulWidget {
  // Construtor da classe TelaCompleta, com uma chave opcional.
  const TelaCompleta({super.key});

  // Cria o estado associado ao widget TelaCompleta.
  @override
  State<TelaCompleta> createState() => _TelaCompletaState();
}

// Classe que gerencia o estado de TelaCompleta.
class _TelaCompletaState extends State<TelaCompleta> {
  // Variáveis de estado para controlar os componentes interativos.
  bool _switchAtivo = true; // Estado inicial do switch (ligado).
  bool _checkboxMarcado = false; // Estado inicial do checkbox (desmarcado).
  double _sliderValor = 20; // Valor inicial do slider (20).
  String _dropdownSelecionado = 'Opção 1'; // Valor inicial do dropdown.
  int _indiceAtual = 0; // Índice inicial da barra de navegação inferior.

  // Chave global para o formulário, usada para validação.
  final _formKey = GlobalKey<FormState>();

  // Função que exibe uma SnackBar com uma mensagem.
  void _mostrarSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Isso é uma SnackBar!'),
      ), // Mostra uma mensagem temporária.
    );
  }

  // Função que exibe um AlertDialog.
  void _mostrarDialog() {
    showDialog(
      context: context, // Contexto atual para exibir o diálogo.
      builder: (context) => AlertDialog(
        title: const Text('Alerta'), // Título do diálogo.
        content: const Text('Isso é um AlertDialog.'), // Conteúdo do diálogo.
        actions: [
          // Botão para fechar o diálogo.
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  // Método que constrói a interface da tela.
  @override
  Widget build(BuildContext context) {
    // SafeArea garante que o conteúdo não seja obstruído por áreas como a barra de status.
    return SafeArea(
      child: Scaffold(
        // Barra superior (AppBar) com título e ações.
        appBar: AppBar(
           iconTheme: const IconThemeData(
            color: Colors.white, // Altera a cor do ícone do Drawer
          ),
          title: const Text('Exemplo Completo'), // Título da AppBar.
          // cor da font do título.
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          centerTitle: true, // Centraliza o título.
          backgroundColor: Colors.indigo, // Cor de fundo da AppBar.
          actions: [
            // Botão de ícone que exibe a SnackBar ao ser pressionado.
            IconButton(
              icon: const Icon(Icons.info),
              tooltip: 'Informações', // Dica ao manter o botão pressionado.
              onPressed: _mostrarSnackBar,
              // cor do ícone.
              color: Colors.white,
            ),
            // Menu suspenso com uma opção que exibe o AlertDialog.
            PopupMenuButton<String>(
              onSelected: (valor) =>
                  _mostrarDialog(), // Ação ao selecionar item.
              itemBuilder: (context) => [
                const PopupMenuItem(value: '1', child: Text('Alerta')),
              ],
            ),
          ],
        ),
        // Menu lateral (Drawer) com cabeçalho e itens.
        drawer: Drawer(
          // cor do menu lateral.
          backgroundColor: Colors.indigo[50],
          child: ListView(
            children: const [
              DrawerHeader(
                
                decoration: BoxDecoration(
                  color: Colors.indigo,
                ), // Cabeçalho com fundo indigo.
                child: Text(
                  'Menu',
                  style: TextStyle(color: Colors.white),
                ), // Texto do cabeçalho.
              ),
              ListTile(title: Text('Item 1')), // Item do menu.
              ListTile(title: Text('Item 2')), // Item do menu.
            ],
          ),
        ),
        // Barra de navegação inferior com dois itens.
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual, // Índice atual da aba selecionada.
          onTap: (index) => setState(
            () => _indiceAtual = index,
          ), // Atualiza o índice ao clicar.
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ), // Item "Início".
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Config',
            ), // Item "Config".
          ],
        ),
        // Botão flutuante que exibe a SnackBar ao ser pressionado.
        floatingActionButton: FloatingActionButton(
          onPressed: _mostrarSnackBar,
          child: const Icon(Icons.add), // Ícone de adição.
        ),
        // Corpo da tela com padding e um formulário.
        body: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ), // Espaçamento interno de 16 pixels.
          child: Form(
            key: _formKey, // Associa a chave ao formulário para validação.
            child: ListView(
              children: [
                // Texto simples.
                const Text('Texto simples e imagem:'),
                const Text('Olá, Flutter!'), // Texto de exemplo.
                const SizedBox(height: 8), // Espaçamento vertical de 8 pixels.
                // Ícone do mascote do Flutter.
                const Icon(Icons.flutter_dash, size: 40, color: Colors.indigo),
                // Imagem carregada da internet.
                const Image(
                  image: NetworkImage(
                    'https://picsum.photos/id/659/200/300.jpg',
                  ),
                  height: 50,
                ),
                const Divider(), // Linha divisória.
                // Campo de texto com validação.
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Digite algo', // Rótulo do campo.
                    border: OutlineInputBorder(), // Borda ao redor do campo.
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Campo obrigatório'
                      : null,
                ),
                const SizedBox(height: 10), // Espaçamento vertical.
                // Checkbox com texto.
                Row(
                  children: [
                    Checkbox(
                      value: _checkboxMarcado, // Estado do checkbox.
                      onChanged: (val) => setState(
                        () => _checkboxMarcado = val!,
                      ), // Atualiza estado.
                    ),
                    const Text('Aceito os termos'),
                  ],
                ),
                // Switch com título.
                SwitchListTile(
                  title: const Text('Ativar notificações'),
                  value: _switchAtivo, // Estado do switch.
                  onChanged: (val) =>
                      setState(() => _switchAtivo = val), // Atualiza estado.
                ),
                // Slider para seleção de valores.
                Slider(
                  value: _sliderValor, // Valor atual do slider.
                  min: 0, // Valor mínimo.
                  max: 100, // Valor máximo.
                  divisions: 10, // Divisões discretas.
                  label: _sliderValor
                      .round()
                      .toString(), // Rótulo com valor arredondado.
                  onChanged: (val) =>
                      setState(() => _sliderValor = val), // Atualiza estado.
                ),
                // Dropdown para seleção de opções.
                DropdownButton<String>(
                  value: _dropdownSelecionado, // Valor selecionado.
                  items: const [
                    DropdownMenuItem(value: 'Opção 1', child: Text('Opção 1')),
                    DropdownMenuItem(value: 'Opção 2', child: Text('Opção 2')),
                  ],
                  onChanged: (val) => setState(
                    () => _dropdownSelecionado = val!,
                  ), // Atualiza estado.
                ),
                const SizedBox(height: 10), // Espaçamento vertical.
                // Linha com três botões.
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, // Espaça botões uniformemente.
                  children: [
                    // Botão elevado que valida o formulário e exibe SnackBar.
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _mostrarSnackBar();
                        }
                      },
                      child: const Text('Enviar'),
                    ),
                    // Botão com borda que exibe o AlertDialog.
                    OutlinedButton(
                      onPressed: _mostrarDialog,
                      child: const Text('Dialog'),
                    ),
                    // Botão de texto que zera o slider.
                    TextButton(
                      onPressed: () => setState(() => _sliderValor = 0),
                      child: const Text('Zerar Slider'),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Espaçamento vertical.
                // Indicador de progresso linear.
                const LinearProgressIndicator(),
                const SizedBox(height: 10), // Espaçamento vertical.
                // Indicador de progresso circular.
                const CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
