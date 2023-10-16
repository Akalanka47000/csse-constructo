import 'package:constructo/components/common/common.dart';
import 'package:constructo/config/themes/text.dart';
import 'package:constructo/state/ui/requisition/requisition_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/common/core/buttons/custom_button.dart';
import '../../state/ui/order/order_bloc.dart';

class ViewDelivery extends StatelessWidget {
  const ViewDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: BlocBuilder<RequisitionUIBloc, RequisitionUIState>(
            builder: (context, state) {
              return BlocBuilder<OrderUIBloc, OrderUIState>(
                builder: (context, orderState) {
                  final requisition = state.requisitions.firstWhere((requisition) => requisition["id"] == orderState.selectedOrder["requisition"]);
                  String status = orderState.selectedOrder["status"];
                  if (status == "paid") {
                    status = "pending-delivery";
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          Text('REQ ${orderState.selectedOrder["id"]}', style: Theme.of(context).textTheme.title3B),
                          const SizedBox(height: 10),
                          Text(orderState.selectedOrder["createdAt"].split("T")[0], style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 10),
                          Text('Status: ${status.toUpperCase()}', style: Theme.of(context).textTheme.bodyB),
                          const SizedBox(height: 25),
                        ],
                      ),
                      BlocBuilder<RequisitionUIBloc, RequisitionUIState>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text('Item', style: Theme.of(context).textTheme.bodySB),
                                  const Spacer(),
                                  Text('Amount', style: Theme.of(context).textTheme.bodySB),
                                ],
                              ),
                              const SizedBox(height: 20),
                              for (dynamic item in requisition["items"])
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(item["item"], style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5), fontStyle: FontStyle.italic)),
                                        const Spacer(),
                                        Text("LKR ${item["amount"]}", style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5), fontStyle: FontStyle.italic)),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              const SizedBox(height: 20),
                              Text(
                                "Notes",
                                style: Theme.of(context).textTheme.bodyB,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                orderState.selectedOrder["notes"],
                                style: Theme.of(context).textTheme.body,
                              ),
                              const SizedBox(height: 30),
                            ],
                          );
                        },
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
