import 'package:constructo/config/themes/text.dart';
import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final dynamic onTap;
  const ActionCard({Key? key, required this.icon, required this.title, required this.description, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40),
            const SizedBox(height: 10),
            Text(title, style: Theme.of(context).textTheme.title3B, textAlign: TextAlign.center),
            const SizedBox(height: 10),
            Text(description, style: Theme.of(context).textTheme.subHeadline.copyWith(color: Colors.black.withOpacity(0.6)), textAlign: TextAlign.center),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
