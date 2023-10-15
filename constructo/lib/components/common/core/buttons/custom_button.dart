import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:constructo/config/themes/themes.dart';
import 'package:constructo/utils/utils.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final IconData? prefixIcon;
  const CustomButton({super.key, this.text, required this.onPressed, this.color, this.padding, this.borderRadius, this.textColor, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color ?? AppColors.primary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          ),
        ),
        padding: MaterialStateProperty.all(padding ?? const EdgeInsets.all(17)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null)
            Padding(
              padding: EdgeInsets.only(right: text != null ? 8: 0),
              child: Icon(
                prefixIcon,
                size: 25,
                color: Colors.white,
              ),
            ),
          if (text != null) Text(text!, style: Theme.of(context).textTheme.bodySB.copyWith(color: textColor ?? Colors.white)),
        ],
      ),
    );
  }
}
