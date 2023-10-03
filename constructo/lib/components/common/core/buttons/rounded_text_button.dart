import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:constructo/config/themes/themes.dart';
import 'package:constructo/utils/utils.dart';

class RoundedTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final String? prefixIcon;
  const RoundedTextButton(this.text, {super.key, required this.onPressed, this.color, this.padding, this.borderRadius, this.textColor, this.prefixIcon});

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
        padding: MaterialStateProperty.all(padding ?? EdgeInsets.symmetric(vertical: isSmallScreen ? 17 : 20, horizontal: 17)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: SvgPicture.asset("assets/icons/$prefixIcon.svg",
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    textColor ?? Colors.white,
                    BlendMode.srcIn,
                  )),
            ),
          Text(text, style: Theme.of(context).textTheme.bodySB.copyWith(color: textColor ?? Colors.white)),
        ],
      ),
    );
  }
}
