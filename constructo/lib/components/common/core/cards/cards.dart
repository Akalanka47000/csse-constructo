import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget child;
  final bool isAction;
  final dynamic onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? outerPadding;
  final BorderRadius? borderRadius;

  const CustomCard({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.child,
    this.isAction = false,
    this.onTap,
    this.outerPadding,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding ?? const EdgeInsets.symmetric(horizontal: 17),
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Container(
          padding: padding ?? const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 16),
            ],
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (prefixIcon != null) prefixIcon!,
              Expanded(child: child),
              suffixIcon ??
                  (isAction
                      ? SvgPicture.asset(
                          "assets/icons/arrow-right.svg",
                          height: 22,
                          width: 22,
                          fit: BoxFit.cover,
                        )
                      : Container())
            ],
          ),
        ),
      ),
    );
  }
}
