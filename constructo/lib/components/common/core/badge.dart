import 'package:flutter/material.dart';
import 'package:constructo/config/themes/themes.dart';

class CustomBadge extends StatelessWidget {
  final Color? background;
  final String? text;
  final Widget? child;

  const CustomBadge({super.key, this.background, this.text, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(color: background ?? AppColors.systemPink, borderRadius: BorderRadius.circular(4)),
      child: child ?? Text(text!, style: Theme.of(context).textTheme.caption2White),
    );
  }
}
