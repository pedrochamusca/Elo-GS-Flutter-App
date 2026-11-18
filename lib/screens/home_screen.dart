import 'package:flutter/material.dart';

import '../models/categoria.dart';
import '../models/golpe.dart';
import '../repositories/golpe_repository.dart';
import '../widgets/categoria_selector.dart';
import '../widgets/destaques_section.dart';
import '../widgets/elo_logo.dart';
import '../widgets/golpe_card.dart';
import '../widgets/resumo_card.dart';
import '../widgets/secao_titulo.dart';
import 'golpe_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GolpeRepository _repository = GolpeRepository();
  Categoria? _categoriaSelecionada;

  List<Golpe> get _golpesFiltrados {
    return _repository.filtrarPorCategoria(_categoriaSelecionada);
  }

  List<Golpe> get _destaques {
    return _repository.getDestaques();
  }

  void _selecionarCategoria(Categoria? categoria) {
    setState(() {
      _categoriaSelecionada = categoria;
    });
  }

  void _abrirDetalhes(Golpe golpe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GolpeDetailScreen(golpe: golpe),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final golpesVisiveis = _golpesFiltrados;
    final destaques = _destaques;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const EloLogo(),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Elo',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Proteção contra golpes',
                  style: TextStyle(
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          ResumoCard(
            totalGolpes: _repository.getGolpes().length,
            totalDenuncias: _repository.totalDenuncias(),
          ),
          const SizedBox(height: 24),
          const SecaoTitulo(
            titulo: 'Golpes em alta',
            subtitulo: 'Os mais denunciados nesta semana',
          ),
          const SizedBox(height: 12),
          DestaquesSection(
            golpes: destaques,
            onGolpeSelecionado: _abrirDetalhes,
          ),
          const SizedBox(height: 24),
          const SecaoTitulo(
            titulo: 'Filtrar por canal',
            subtitulo: 'Escolha por onde a mensagem chegou',
          ),
          const SizedBox(height: 12),
          CategoriaSelector(
            categorias: Categoria.values,
            categoriaSelecionada: _categoriaSelecionada,
            onCategoriaSelecionada: _selecionarCategoria,
          ),
          const SizedBox(height: 24),
          SecaoTitulo(titulo: 'Golpes mapeados (${golpesVisiveis.length})'),
          const SizedBox(height: 12),
          if (golpesVisiveis.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(
                child: Text('Nenhum golpe encontrado para este canal.'),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: golpesVisiveis.length,
              itemBuilder: (context, index) {
                final golpe = golpesVisiveis[index];

                return GolpeCard(
                  golpe: golpe,
                  onTap: () => _abrirDetalhes(golpe),
                );
              },
            ),
        ],
      ),
    );
  }
}
