import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:constructo/components/common/common.dart';
import 'package:constructo/config/themes/themes.dart';

import 'skeleton.dart';

export 'header.dart';

class CardPack extends StatelessWidget {
  final String? title;
  final List data;
  final bool noCard;
  final bool hideDivider;
  final bool hideItemTitle;
  final bool hideItemSubtitle;
  final bool showChannel;
  final Function? onItemPress;
  final int? minItems;
  final EdgeInsetsGeometry? outerPadding;

  const CardPack({
    super.key,
    this.title,
    required this.data,
    this.noCard = false,
    this.hideDivider = false,
    this.hideItemTitle = false,
    this.hideItemSubtitle = false,
    this.onItemPress,
    this.showChannel = false,
    this.minItems = 4, this.outerPadding,
  });

  gridDelegate(context) {
    int horizontalItemCount = 2;
    if (MediaQuery.of(context).orientation == Orientation.landscape) horizontalItemCount = 4;
    final width = (MediaQuery.of(context).size.width - 17 * 5) / horizontalItemCount;
    final aspectRatio = hideItemTitle && hideItemSubtitle ? 1.0 : (width / (width + 23));
    return SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: MediaQuery.of(context).size.width / horizontalItemCount,
      childAspectRatio: aspectRatio,
      crossAxisSpacing: 17,
      mainAxisSpacing: 17,
    );
  }

  @override
  Widget build(BuildContext context) {
    final child = Column(
      children: [
        if (title != null) CardPackHeader(title: title!, hideDivider: hideDivider),
        data.isNotEmpty
            ? GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: gridDelegate(context),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (onItemPress != null) {
                        onItemPress!(data[index]);
                      }
                    },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              child: CustomNetworkImage(
                                url: data[index].photo!,
                                size: 80,
                                radius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          if (!hideItemTitle)
                            Column(
                              children: [
                                const SizedBox(height: 8),
                                Text(data[index].title!, style: Theme.of(context).textTheme.caption1SB),
                              ],
                            ),
                          if ((data[index].subtitle != null || data[index].author != null) && !hideItemSubtitle)
                            Builder(builder: (context) {
                              return Column(
                                children: [const SizedBox(height: 4), Text(data[index].author ?? data[index].subtitle ?? "", style: Theme.of(context).textTheme.caption2MediumGray)],
                              );
                            }),
                        ],
                      ),
                    ),
                  );
                },
              )
            : CardPackSkeleton(gridDelegate: gridDelegate(context), hideItemTitle: hideItemTitle, hideItemSubtitle: hideItemSubtitle, showChannel: showChannel, minItems: minItems),
      ],
    );
    if (!noCard) return child;
    return CustomCard(
      outerPadding: outerPadding ?? const EdgeInsets.only(bottom: 9),
      child: child,
    );
  }
}
