import 'package:flutter/material.dart';
import 'package:iwwrw20/app/theme/color.dart';

class BuildStep extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const BuildStep({
    Key? key,
    required this.icon,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Icon(icon, size: 48, color: AppColors.greenPrimary),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
