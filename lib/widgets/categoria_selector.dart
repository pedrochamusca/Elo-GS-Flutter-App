import 'package:flutter/material.dart';

import '../models/categoria.dart';

class CategoriaSelector extends StatelessWidget {
  final List<Categoria> categorias;
  final Categoria? categoriaSelecionada;
  final ValueChanged<Categoria?> onCategoriaSelecionada;

  const CategoriaSelector({
    super.key,
    required this.categorias,
    required this.categoriaSelecionada,
    required this.onCategoriaSelecionada,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categorias.length + 1,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            return ChoiceChip(
              label: const Text('Todas'),
              selected: categoriaSelecionada == null,
              onSelected: (_) => onCategoriaSelecionada(null),
            );
          }

          final categoria = categorias[index - 1];

          return ChoiceChip(
            label: Text(categoria.label),
            selected: categoriaSelecionada == categoria,
            onSelected: (_) => onCategoriaSelecionada(categoria),
          );
        },
      ),
    );
  }
}
