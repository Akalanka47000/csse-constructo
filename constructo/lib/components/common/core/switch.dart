import 'package:flutter/cupertino.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final dynamic onChanged;

  const CustomSwitch({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: FittedBox(
        fit: BoxFit.contain,
        child: CupertinoSwitch(value: value, onChanged: onChanged),
      ),
    );
  }
}
