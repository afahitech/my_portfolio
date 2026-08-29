import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final String label;
  final bool soft;

  const SkillChip({
    super.key,
    required this.label,
    this.soft = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: soft ? Colors.green.shade50 : Colors.blue.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: soft ? Colors.green.shade200 : Colors.blue.shade200,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: soft ? Colors.green.shade700 : Colors.blue.shade700,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}