import 'package:flutter/material.dart';
import 'package:constructo/config/themes/themes.dart';

class CardPackHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionPress;
  final bool hideDivider;
  final double? dividerBottomPadding;

  const CardPackHeader({super.key, required this.title, this.actionText, this.onActionPress, this.hideDivider = false, this.dividerBottomPadding});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title, style: Theme.of(context).textTheme.title3SB),
            const Spacer(),
            if (actionText != null)
              GestureDetector(
                onTap: onActionPress ?? () {},
                child: Text(actionText!, style: Theme.of(context).textTheme.footnoteSBPrimary),
              ),
          ],
        ),
        if (!hideDivider)
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: dividerBottomPadding ?? 15),
            child: Divider(thickness: 2, height: 0, color: AppColors.divider),
          )
      ],
    );
  }
}
