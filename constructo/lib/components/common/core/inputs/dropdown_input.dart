import 'package:flutter/material.dart';
import 'package:constructo/config/themes/themes.dart';

class DropdownInput extends StatelessWidget {
  final String? value;
  final String placeholder;
  final Widget? prefixIcon;
  final List<dynamic> items;
  final EdgeInsetsGeometry? padding;
  final dynamic onChange;

  const DropdownInput({super.key, required this.placeholder, this.value, this.prefixIcon, required this.items, this.padding, this.onChange});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.black.withOpacity(1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.black.withOpacity(1),
          ),
        ),
        prefixIcon: prefixIcon,
        labelText: placeholder,
        labelStyle: Theme.of(context).textTheme.bodyMediumGray,
        contentPadding: padding ?? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: value,
          onChanged: onChange ?? (value) {},
          items: items.map((dynamic item) {
            dynamic value = item;
            dynamic label = item;
            if (value.runtimeType != String) {
              value = item["value"];
              label = item["label"];
            }
            return DropdownMenuItem<String>(
              value: value,
              child: Text(label, style: Theme.of(context).textTheme.bodyDarkGray),
            );
          }).toList(),
          style: Theme.of(context).textTheme.bodyDarkGray,
          hint: Text(placeholder, style: Theme.of(context).textTheme.bodyMediumGray),
        ),
      ),
    );
  }
}
