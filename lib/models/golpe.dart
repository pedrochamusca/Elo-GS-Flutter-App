import 'categoria.dart';
import 'nivel_risco.dart';

class Golpe {
  final int id;
  final String titulo;
  final String descricao;
  final String sinalDeAlerta;
  final String comoAgir;
  final List<Categoria> categorias;
  final NivelRisco nivelRisco;
  final int denuncias;
  final String imagem;
  final bool emDestaque;

  const Golpe({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.sinalDeAlerta,
    required this.comoAgir,
    required this.categorias,
    required this.nivelRisco,
    required this.denuncias,
    required this.imagem,
    this.emDestaque = false,
  });

  String get canais {
    return categorias.map((categoria) => categoria.label).join(', ');
  }
}
