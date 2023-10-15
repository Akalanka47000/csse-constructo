import 'package:constructo/components/common/common.dart';
import 'package:constructo/components/delivery/card.dart';
import 'package:flutter/material.dart';

import '../../components/order/card.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            OrderCard(id: "#234s", date: DateTime.now(),items: const [
              "Item 1",
              "Item 2",
            ]),
            const SizedBox(height: 20),
            OrderCard(id: "#csdf", date: DateTime.now(),items: const [
              "Item 1",
              "Item 2",
            ]),
            const SizedBox(height: 20),
            OrderCard(id: "#sd12", date: DateTime.now(),  items: const [
              "Item 1",
              "Item 2",
            ]),
            OrderCard(id: "#455424", date: DateTime.now(),  items: const [
              "Item 1",
              "Item 2",
            ]),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          const Spacer(),
          CustomButton(
            borderRadius: BorderRadius.circular(300),
            prefixIcon: Icons.add,
            onPressed: () {
              Navigator.pushNamed(context, '/add-order');
            },
          ),
        ],
      ),
    );
  }
}
