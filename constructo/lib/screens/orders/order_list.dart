import 'package:constructo/components/common/common.dart';
import 'package:constructo/components/delivery/card.dart';
import 'package:constructo/state/ui/order/order_bloc.dart';
import 'package:flodash/flodash.dart';
import 'package:flodash/modules/collection/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/order/card.dart';
import '../../state/ui/requisition/requisition_bloc.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
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
        title: const Text('Purchase Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<RequisitionUIBloc, RequisitionUIState>(
          builder: (context, state) {
            return BlocBuilder<OrderUIBloc, OrderUIState>(
              builder: (context, orderState) {
                return ListView(
                  children: [
                    for (dynamic order in orderState.orders)
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          Builder(builder: (context) {
                            final requisition = first(filter(state.requisitions, (e) {
                              return e["id"] == order["requisition"];
                            }));
                            return OrderCard(
                              id: order["id"],
                              date: order["createdAt"],
                              items: requisition["items"].map((item) => item["item"]).toList(),
                              order: order,
                            );
                          }),
                        ],
                      ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            );
          },
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
