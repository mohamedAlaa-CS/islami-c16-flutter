import 'package:flutter/material.dart';
import 'package:islami_c16/ui/design.dart';

class DotIndecator extends StatelessWidget {
  const DotIndecator({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: isActive ? 20 : 10,
      decoration: BoxDecoration(
        color: isActive ? AppColors.gold : AppColors.gray,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
