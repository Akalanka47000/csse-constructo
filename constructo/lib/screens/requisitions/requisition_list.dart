import 'package:constructo/components/common/common.dart';
import 'package:constructo/components/requisistion/card.dart';
import 'package:flutter/material.dart';

class RequisitionList extends StatelessWidget {
  const RequisitionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constructo Express'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: "Date, item, REQ number",
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomButton(
                        "SEARCH",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.black),
                const SizedBox(height: 25),
              ],
            ),
            RequisitionCard(id: "#234s", date: DateTime.now(), status: "PENDING", items: const [
              "Item 1",
              "Item 2",
            ]),
            const SizedBox(height: 20),
            RequisitionCard(id: "#csdf", date: DateTime.now(), status: "PENDING", items: const [
              "Item 1",
              "Item 2",
            ]),
            const SizedBox(height: 20),
            RequisitionCard(id: "#sd12", date: DateTime.now(), status: "PENDING", items: const [
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
