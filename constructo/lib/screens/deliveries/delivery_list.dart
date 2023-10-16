import 'package:constructo/components/common/common.dart';
import 'package:constructo/components/delivery/card.dart';
import 'package:flodash/flodash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/ui/order/order_bloc.dart';
import '../../state/ui/requisition/requisition_bloc.dart';

class DeliveryList extends StatefulWidget {
  const DeliveryList({super.key});

  @override
  State<DeliveryList> createState() => _DeliveryListState();
}

class _DeliveryListState extends State<DeliveryList> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<RequisitionUIBloc>(context).add(const LoadRequisitions());
    BlocProvider.of<OrderUIBloc>(context).add(const LoadOrders());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Receipts'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<RequisitionUIBloc, RequisitionUIState>(
          builder: (context, requisitionState) {
            return BlocBuilder<OrderUIBloc, OrderUIState>(
              builder: (context, state) {
                return ListView(
                  children: [
                    const SizedBox(height: 30),
                    for (dynamic delivery in filter(state.orders, (e) {
                      return e["status"] == "paid" || e["status"] == "delivered";
                    }))
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          Builder(
                            builder: (context) {
                              final requisition = first(filter(requisitionState.requisitions, (e) {
                                return e["id"] == delivery["requisition"];
                              }));
                              return DeliveryCard(
                                id: delivery["id"],
                                date: delivery["createdAt"],
                                items: requisition["items"].map((item) => item["item"]).toList(),
                                delivery: delivery,
                              );
                            },
                          ),
                        ],
                      ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
