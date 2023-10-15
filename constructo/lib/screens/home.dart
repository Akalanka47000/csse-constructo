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
            ActionCard(
                icon: Icons.calendar_month,
                title: "Requisitions",
                description: "Manage your requisitions. This is where you would request and approve materials.",
                onTap: () {
                  Navigator.pushNamed(context, '/requisition-list');
                }),
            const SizedBox(height: 20),
            ActionCard(
              icon: Icons.file_present_outlined,
              title: "Orders",
              description: "Manage your purchase orders for requisitions. Find and track orders.",
              onTap: () {
                Navigator.pushNamed(context, '/order-list');
              },
            ),
            const SizedBox(height: 20),
            ActionCard(
              icon: Icons.people,
              title: "Deliveries",
              description: "Manage your deliveries. Add new deliveries and track existing ones. Get receipts and invoices.",
              onTap: () {
                Navigator.pushNamed(context, '/delivery-list');
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          const Spacer(),
          CustomButton(
            text: "NEW",
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
