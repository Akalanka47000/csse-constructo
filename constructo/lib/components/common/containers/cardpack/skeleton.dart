import 'package:flutter/material.dart';
import 'package:constructo/components/common/common.dart';

class CardPackSkeleton extends StatelessWidget {
  final SliverGridDelegateWithMaxCrossAxisExtent gridDelegate;
  final bool hideItemTitle;
  final bool hideItemSubtitle;
  final bool showChannel;
  final int? minItems;

  const CardPackSkeleton({super.key, required this.gridDelegate, this.hideItemTitle = true, this.hideItemSubtitle = true, this.showChannel = false, this.minItems = 4});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: gridDelegate,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: minItems,
      itemBuilder: (context, index) {
        return FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(width: 80, height: 80),
              const SizedBox(height: 4),
              if (!hideItemTitle) Skeleton(width: 40, height: 6, radius: BorderRadius.circular(3)),
              if (!hideItemSubtitle)
                Column(
                  children: [
                    const SizedBox(height: 4),
                    Skeleton(width: 20, height: 4, radius: BorderRadius.circular(3)),
                  ],
                ),
              if (showChannel)
                Column(
                  children: [
                    const SizedBox(height: 4),
                    Skeleton(width: 20, height: 4, radius: BorderRadius.circular(3)),
                  ],
                )
            ],
          ),
        );
      },
    );
  }
}
