import 'package:flutter/material.dart';

import '../models/golpe.dart';
import 'destaque_card.dart';

class DestaquesSection extends StatelessWidget {
  final List<Golpe> golpes;
  final ValueChanged<Golpe> onGolpeSelecionado;

  const DestaquesSection({
    super.key,
    required this.golpes,
    required this.onGolpeSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    if (golpes.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: golpes.length,
        itemBuilder: (context, index) {
          final golpe = golpes[index];

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: DestaqueCard(
              golpe: golpe,
              onTap: () => onGolpeSelecionado(golpe),
            ),
          );
        },
      ),
    );
  }
}
