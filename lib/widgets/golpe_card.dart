import 'package:flutter/material.dart';

import '../models/golpe.dart';
import 'info_linha.dart';
import 'nivel_risco_badge.dart';

class GolpeCard extends StatelessWidget {
  final Golpe golpe;
  final VoidCallback onTap;

  const GolpeCard({super.key, required this.golpe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  golpe.imagem,
                  width: 104,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      golpe.titulo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
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
                    const SizedBox(height: 4),
                    InfoLinha(
                      icone: Icons.forum_outlined,
                      texto: golpe.canais,
                      maxLinhas: 2,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
