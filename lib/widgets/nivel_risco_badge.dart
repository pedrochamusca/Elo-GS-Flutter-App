import 'package:flutter/material.dart';

import '../models/nivel_risco.dart';
import '../theme/app_colors.dart';

class NivelRiscoBadge extends StatelessWidget {
  final NivelRisco nivel;

  const NivelRiscoBadge({super.key, required this.nivel});

  Color _corFundo(bool isDark) {
    switch (nivel) {
      case NivelRisco.alto:
        return isDark ? AppColors.riscoAltoEscuro : AppColors.riscoAltoClaro;
      case NivelRisco.medio:
        return isDark ? AppColors.riscoMedioEscuro : AppColors.riscoMedioClaro;
      case NivelRisco.baixo:
        return isDark ? AppColors.riscoBaixoEscuro : AppColors.riscoBaixoClaro;
    }
  }

  Color _corTexto(bool isDark) {
    switch (nivel) {
      case NivelRisco.alto:
        return isDark
            ? AppColors.riscoAltoTextoEscuro
            : AppColors.riscoAltoTextoClaro;
      case NivelRisco.medio:
        return isDark
            ? AppColors.riscoMedioTextoEscuro
            : AppColors.riscoMedioTextoClaro;
      case NivelRisco.baixo:
        return isDark
            ? AppColors.riscoBaixoTextoEscuro
            : AppColors.riscoBaixoTextoClaro;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final corTexto = _corTexto(isDark);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _corFundo(isDark),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.warning_amber_rounded, size: 14, color: corTexto),
          const SizedBox(width: 4),
          Text(
            'Risco ${nivel.label}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: corTexto,
            ),
          ),
        ],
      ),
    );
  }
}
