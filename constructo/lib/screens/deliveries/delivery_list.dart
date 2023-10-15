import 'package:constructo/components/common/common.dart';
import 'package:constructo/components/delivery/card.dart';
import 'package:flutter/material.dart';

class DeliveryList extends StatelessWidget {
  const DeliveryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Receipts'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            DeliveryCard(id: "#234s", date: DateTime.now(),items: const [
              "Item 1",
              "Item 2",
            ]),
            const SizedBox(height: 20),
            DeliveryCard(id: "#csdf", date: DateTime.now(),items: const [
              "Item 1",
              "Item 2",
            ]),
            const SizedBox(height: 20),
            DeliveryCard(id: "#sd12", date: DateTime.now(),  items: const [
              "Item 1",
              "Item 2",
            ]),
            DeliveryCard(id: "#455424", date: DateTime.now(),  items: const [
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
              Navigator.pushNamed(context, '/add-delivery');
            },
          ),
        ],
      ),
    );
  }
}
