import 'package:constructo/components/common/common.dart';
import 'package:constructo/components/home/action.dart';
import 'package:constructo/config/themes/text.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constructo Express'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    Text('Welcome, User', style: Theme.of(context).textTheme.title3B),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.black),
                const SizedBox(height: 25),
              ],
            ),
            ActionCard(icon: Icons.calendar_month, title: "Requisitions", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", onTap: () {
              Navigator.pushNamed(context, '/requisition-list');
            }),
            const SizedBox(height: 20),
            const ActionCard(icon: Icons.people, title: "Deliveries", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            const SizedBox(height: 20),
            const ActionCard(icon: Icons.file_present_outlined, title: "Items", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          const Spacer(),
          CustomButton(
            "NEW",
            prefixIcon: Icons.add,
            onPressed: () {
              Navigator.pushNamed(context, '/add-requisition');
            },
          ),
        ],
      ),
    );
  }
}
