import 'package:flutter/material.dart';

class DateInput extends StatelessWidget {
  final String? initial;
  final Function onDateSelect;
  final String placeholder;
  final TextEditingController? controller;
  const DateInput({super.key, this.initial, required this.onDateSelect, required this.placeholder, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: placeholder,
        hintText: placeholder,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap: () {
              String? date = initial;
              if (date != null && date.isNotEmpty && date.split("-").first.length != 4) {
                date = date.split("-").reversed.join("-");
              }
              showDatePicker(
                context: context,
                initialDate: date == null || date.isEmpty ? DateTime.now() : DateTime.parse(date),
                firstDate: DateTime(1800),
                lastDate: DateTime(2500),
              ).then((date) {
                if (date != null) {
                  onDateSelect(date.toString().substring(0, 10));
                }
              });
            },
            child: const Icon(
                Icons.calendar_month
            ),
          ),
        ),
      ),
    );
  }
}
