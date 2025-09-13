import '../models/exercicio.dart';

class mockDB {
  static final Map<String, List<Exercicio>> _dados = {
    'joao': [
      Exercicio(
        nome: 'Supino reto',
        series: 3,
        repeticoes: 12,
        observacoes: 'Peso leve',
      ),
      Exercicio(
        nome: 'Agachamento',
        series: 4,
        repeticoes: 10,
        observacoes: 'Postura correta',
      ),
      Exercicio(nome: 'teste', series: 4, repeticoes: 10, observacoes: 'teste'),
    ],
    'maria': [
      Exercicio(
        nome: 'Esteira',
        series: 1,
        repeticoes: 20,
        observacoes: 'Aquecimento',
      ),
      Exercicio(
        nome: 'Levantamento terra',
        series: 3,
        repeticoes: 8,
        observacoes: 'Aumentar carga',
      ),
    ],
    'diego': [
      Exercicio(
        nome: 'Remada baixa',
        series: 3,
        repeticoes: 15,
        observacoes: 'Lento e controlado',
      ),
      Exercicio(
        nome: 'Flexão de braço',
        series: 3,
        repeticoes: 20,
        observacoes: 'Explosão',
      ),
    ],
  };

  static List<Exercicio> getExerciciosPara(String user) {
    return _dados[user] ?? [];
  }
}
