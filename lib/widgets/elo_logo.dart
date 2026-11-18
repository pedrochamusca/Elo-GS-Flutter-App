import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class EloLogo extends StatelessWidget {
  final double tamanho;

  const EloLogo({super.key, this.tamanho = 40});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: tamanho / 2,
      backgroundColor: AppColors.navy,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Image.asset('assets/images/logo_elo.png'),
      ),
    );
  }
}
