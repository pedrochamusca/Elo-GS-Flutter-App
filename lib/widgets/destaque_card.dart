import 'package:flutter/material.dart';

import '../models/golpe.dart';
import 'info_linha.dart';
import 'nivel_risco_badge.dart';
import 'selo_em_alta.dart';

class DestaqueCard extends StatelessWidget {
  final Golpe golpe;
  final VoidCallback onTap;

  const DestaqueCard({super.key, required this.golpe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    golpe.imagem,
                    width: double.infinity,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: SeloEmAlta(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      golpe.titulo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    NivelRiscoBadge(nivel: golpe.nivelRisco),
                    const SizedBox(height: 6),
                    InfoLinha(
                      icone: Icons.groups_outlined,
                      texto: '${golpe.denuncias} denúncias',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
