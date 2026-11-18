import 'package:flutter/material.dart';

import '../models/golpe.dart';
import '../widgets/info_bloco.dart';
import '../widgets/info_linha.dart';
import '../widgets/nivel_risco_badge.dart';
import '../widgets/selo_em_alta.dart';

class GolpeDetailScreen extends StatelessWidget {
  final Golpe golpe;

  const GolpeDetailScreen({super.key, required this.golpe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhes do golpe',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              golpe.imagem,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            golpe.titulo,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              NivelRiscoBadge(nivel: golpe.nivelRisco),
              if (golpe.emDestaque) ...[
                const SizedBox(width: 8),
                const SeloEmAlta(),
              ],
            ],
          ),
          const SizedBox(height: 20),
          InfoBloco(
            icone: Icons.forum_outlined,
            titulo: 'Canais usados',
            texto: golpe.canais,
          ),
          InfoBloco(
            icone: Icons.mark_email_unread_outlined,
            titulo: 'Como o golpe chega',
            texto: golpe.descricao,
          ),
          InfoBloco(
            icone: Icons.warning_amber_rounded,
            titulo: 'Sinal de alerta',
            texto: golpe.sinalDeAlerta,
            destaque: true,
          ),
          InfoBloco(
            icone: Icons.verified_user_outlined,
            titulo: 'Como agir',
            texto: golpe.comoAgir,
          ),
          const SizedBox(height: 8),
          InfoLinha(
            icone: Icons.groups_outlined,
            texto: '${golpe.denuncias} pessoas já denunciaram esse golpe',
            maxLinhas: 2,
          ),
        ],
      ),
    );
  }
}
