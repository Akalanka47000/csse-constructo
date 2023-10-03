import 'package:flutter/material.dart';
import 'package:constructo/config/themes/themes.dart';

class PillButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  const PillButton(this.text, {super.key, required this.onPressed, this.color, this.textColor, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
        decoration: BoxDecoration(
          color: color ?? AppColors.blueLight,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(text, style: Theme.of(context).textTheme.footnote.copyWith(color: textColor ?? AppColors.blue)),
      ),
    );
  }
}
