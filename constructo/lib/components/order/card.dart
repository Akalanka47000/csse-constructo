import 'package:constructo/config/themes/text.dart';
import 'package:constructo/state/ui/order/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/core/buttons/custom_button.dart';

class OrderCard extends StatelessWidget {
  final String id;
  final String date;
  final List<dynamic> items;
  final dynamic order;
  const OrderCard({Key? key, required this.id, required this.date, required this.items, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(date.split("T")[0], style: Theme.of(context).textTheme.bodySB),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text('PO $id', style: Theme.of(context).textTheme.title3B),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(items.join(", "), style: Theme.of(context).textTheme.bodySB),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              CustomButton(
                text: "View",
                onPressed: () {
                  context.read<OrderUIBloc>().add(SetSelectedOrder(order));
                  Navigator.pushNamed(context, '/view-order');
                },
                padding: const EdgeInsets.all(12),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
