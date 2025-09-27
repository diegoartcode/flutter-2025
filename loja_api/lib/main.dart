import 'package:flutter/material.dart'; // importa os widgets básicos do flutter (Material design)
import 'dart:convert'; // importa a biblioteca para codificar/decodificar o JSON
import 'package:http/http.dart'
    as http; // importa o pacote http para fazer requisições de rede

const String apiUrl = 'https://fakestoreapi.com/products'; // url base da API

// 1 - modelo de dados (estrutura da informação que a API retorna)
// classe que representa em único PRODUTO

class Product {
  final int id; // identificador único do produto
  final String title; // nome do produto
  final double price; // preço do produto
  final String description; // descrição do produto
  final String category; // categoria do produto
  final String image; // imagem do produto
  final Map<String, dynamic> rating; // objeto de avaliação (rate e count)

  // construtor principal da classe
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  // construtor de fabrica (factory) para criar um objeto Product a partir de um JSON

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num)
          .toDouble(), // o preço pode vim como int ou double na API, que o toDouble() gatante que sempre será double.
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: json['rating'] as Map<String, dynamic>,
    );
  }
}

// 2 função principal e configuração do app

void main() {
  runApp(const MyApp());
}

// widget principal que define a estrutura visual e o tema (StatelessWidget, pois é estático)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja Fake API',
      debugShowCheckedModeBanner:
          false, // Remove a faixa de debug no canto superior
      theme: ThemeData(
        primarySwatch: Colors.indigo, // Define a paleta de cores primárias
        useMaterial3: true, // usa o tema material 3 mais moderno

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const ProductListScreen(),
    );
  }
}

// 3 - tela de listagem de produtos

// tela de listagem (StatefulWidget para gerenciar o estado da requisição)
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // future que conterá a lista de produtos quando a requisição for concluida
  late Future<List<Product>> _futureProduct;

  @override
  void initState() {
    super.initState();
    // inicializa o future na criação do estado
    _futureProduct = _fetchProducts();
  }

  // função assicrona para buscar os produtos da API (lógica de rede)
  Future<List<Product>> _fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // se a requisição for bem-sucedida (status 200), decodifica o JSON
        final List<dynamic> jsonList = jsonDecode(response.body);
        // usa o metodo map para converter cada item json em um objeto Product
        return jsonList.map((json) => Product.fromJson(json)).toList();
      } else {
        // se a resposta não for 200 OK, lança uma exceção com o status
        throw Exception(
          'Falha ao carregar produtos. Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      // captura e trata erros de rede (ex. sem conexão) ou de parsing do json
      print('Erro na requisição: $e');
      rethrow; // relança o erro para ser capturado pelo FutureBuilder
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produtos Disponíveis'), elevation: 4),
      // FutureBuilder gerencia a tela com base no estado do Future (_futureProduct)
      body: FutureBuilder<List<Product>>(
        future: _futureProduct,
        builder: (context, snapshot) {
          // 1. caso de carregamento:conexão aguardando
          if (snapshot.connectionState == ConnectionState.waiting) {
            // exibe um indicador de progresso enquanto carrega
            return const Center(child: CircularProgressIndicator());
          }
          // 2. caso de erro: ocorreu  um erro na requisição
          else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Erro ao carregar os dados: ${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }
          // 3. caso de sucesso dados carregado com sucesso
          else if (snapshot.hasData) {
            // lista de produtos esta disponivel
            final products = snapshot.data!;
            // listView.builder constroi a lista sob demanda (otimizado)

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    // widget Hero para criar a transição animada da imagem entre talas
                    leading: Hero(
                      tag: 'product-image-${product.id}',
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(
                              product.image,
                            ), // carrega a imagem da url
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow
                          .ellipsis, // trunca o texto se for muito longo
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          product.category,
                          style: TextStyle(
                            color: Colors.indigo.shade400,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'R\$ ${product.price.toStringAsFixed(2)}', // formata o preço com 2 casas decimais
                        ),
                      ],
                    ),

                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(product: product),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Nenhum produto encontrado'));
          }
        },
      ),
    );
  }
}

// 4. TELA DE DETALHES DO PRODUTO

// Tela de detalhes (StatelessWidget, pois exibe dados recebidos)
class ProductDetailScreen extends StatelessWidget {
  final Product
  product; // O produto é recebido via construtor (dados imutáveis)

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Extrai o rating e count do Map 'rating', usando 0.0 e 0 como fallback (??)
    final double rate = product.rating['rate'] ?? 0.0;
    final int count = product.rating['count'] ?? 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Produto')),
      // SingleChildScrollView permite que a tela role se o conteúdo for grande
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Imagem (continuação da animação Hero)
            Center(
              child: Hero(
                tag:
                    'product-image-${product.id}', // Mesma tag da tela anterior
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Image.network(
                    product.image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    // Widget 'loadingBuilder' para mostrar um indicador de progresso durante o carregamento
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null)
                        return child; // Se já carregou, retorna a imagem
                      return SizedBox(
                        height: 250,
                        child: Center(
                          child: CircularProgressIndicator(
                            // Calcula o progresso do carregamento da imagem
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                    // Widget 'errorBuilder' para mostrar um ícone se a imagem falhar ao carregar
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 250,
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 80,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Container para os detalhes do texto
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Preço em destaque
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'R\$ ${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.indigo.shade700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Categoria e Avaliação em uma linha
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Categoria
                      Row(
                        children: [
                          const Icon(Icons.label, size: 18, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(
                            product.category,
                            style: const TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),

                      // Avaliação
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.amber.shade700,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            // Exibe a nota e o número de avaliações
                            '${rate.toStringAsFixed(1)}/5.0 (${count} avaliações)',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(height: 30), // Linha divisória
                  // Descrição - Título
                  const Text(
                    'Descrição:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Descrição - Conteúdo
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
      // Botão de compra fixo na parte inferior
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.white,
        child: ElevatedButton.icon(
          onPressed: () {
            // Lógica de compra simulada: exibe um SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Produto adicionado ao carrinho! (Simulado)'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart),
          label: const Text(
            'Adicionar ao Carrinho',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade700,
            foregroundColor: Colors.white,
            minimumSize: const Size(
              double.infinity,
              55,
            ), // Garante largura total e altura fixa
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 8,
          ),
        ),
      ),
    );
  }
}
