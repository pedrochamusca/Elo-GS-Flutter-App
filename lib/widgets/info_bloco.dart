import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class InfoBloco extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String texto;
  final bool destaque;

  const InfoBloco({
    super.key,
    required this.icone,
    required this.titulo,
    required this.texto,
    this.destaque = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final corFundoDestaque =
        isDark ? AppColors.orangeContainerDark : AppColors.orangeContainer;
    final corTextoDestaque =
        isDark ? AppColors.orangeOnContainerDark : AppColors.orangeOnContainer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: destaque
            ? corFundoDestaque
            : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icone, color: AppColors.orange, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: destaque ? corTextoDestaque : null,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  texto,
                  style: TextStyle(
                    fontSize: 15,
                    color: destaque ? corTextoDestaque : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
