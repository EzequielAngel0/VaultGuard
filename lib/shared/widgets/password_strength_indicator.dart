import 'package:flutter/material.dart';

import '../../features/password_generator/domain/password_generator.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  const PasswordStrengthIndicator({
    super.key,
    required this.strength,
    this.showLabel = true,
  });

  final PasswordStrength strength;
  final bool showLabel;

  static const _data = {
    PasswordStrength.none:   (label: '',        color: Color(0xFF2A2A4A), fill: 0.0),
    PasswordStrength.weak:   (label: 'Débil',   color: Color(0xFFCF6679), fill: 0.25),
    PasswordStrength.fair:   (label: 'Regular', color: Color(0xFFFFB74D), fill: 0.5),
    PasswordStrength.good:   (label: 'Buena',   color: Color(0xFF4FC3F7), fill: 0.75),
    PasswordStrength.strong: (label: 'Fuerte',  color: Color(0xFF66BB6A), fill: 1.0),
  };

  @override
  Widget build(BuildContext context) {
    final d = _data[strength]!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: d.fill,
            minHeight: 6,
            backgroundColor: const Color(0xFF2A2A4A),
            valueColor: AlwaysStoppedAnimation<Color>(d.color),
          ),
        ),
        if (showLabel && strength != PasswordStrength.none) ...[
          const SizedBox(height: 4),
          Text(
            d.label,
            style: TextStyle(
              fontSize: 12,
              color: d.color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }
}
