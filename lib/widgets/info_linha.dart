import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class InfoLinha extends StatelessWidget {
  final IconData icone;
  final String texto;
  final Color? corTexto;
  final int maxLinhas;

  const InfoLinha({
    super.key,
    required this.icone,
    required this.texto,
    this.corTexto,
    this.maxLinhas = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icone, size: 18, color: AppColors.orange),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            texto,
            maxLines: maxLinhas,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, color: corTexto),
          ),
        ),
      ],
    );
  }
}
