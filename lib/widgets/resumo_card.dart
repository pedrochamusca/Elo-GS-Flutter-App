import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'info_linha.dart';

class ResumoCard extends StatelessWidget {
  final int totalGolpes;
  final int totalDenuncias;

  const ResumoCard({
    super.key,
    required this.totalGolpes,
    required this.totalDenuncias,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.navyLight : AppColors.navy,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.shield, color: AppColors.orange, size: 28),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Antes do Pix, desconfie.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Conheça os golpes mais denunciados pela comunidade e aprenda a reconhecê-los na hora, com a sua família junto.',
            style: TextStyle(fontSize: 15, color: AppColors.cream),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: InfoLinha(
                  icone: Icons.report_outlined,
                  texto: '$totalGolpes golpes mapeados',
                  corTexto: Colors.white,
                  maxLinhas: 2,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: InfoLinha(
                  icone: Icons.groups_outlined,
                  texto: '$totalDenuncias denúncias',
                  corTexto: Colors.white,
                  maxLinhas: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
