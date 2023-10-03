import 'package:flutter/material.dart';
import 'package:constructo/config/themes/text.dart';

class BulletText extends StatelessWidget {
  final String text;
  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(width: 12),
        const Text("• "),
        const SizedBox(width: 3),
        Expanded(
          child: Text(text, style: Theme.of(context).textTheme.subHeadline),
        )
      ],
    );
  }
}
