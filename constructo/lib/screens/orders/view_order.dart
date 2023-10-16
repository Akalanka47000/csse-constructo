import 'dart:ffi';

import 'package:constructo/components/common/common.dart';
import 'package:constructo/config/themes/text.dart';
import 'package:constructo/services/order_service.dart';
import 'package:constructo/state/ui/order/order_bloc.dart';
import 'package:constructo/state/ui/requisition/requisition_bloc.dart';
import 'package:flodash/flodash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/common/core/buttons/custom_button.dart';
import '../../models/order.dart';
import '../../models/requisition.dart';
import '../../services/requisition_service.dart';

class ViewOrder extends StatefulWidget {
  const ViewOrder({super.key});

  @override
  State<ViewOrder> createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  TextEditingController idController = TextEditingController();

  TextEditingController createdAtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<RequisitionUIBloc, RequisitionUIState>(
          builder: (context, state) {
            return BlocBuilder<OrderUIBloc, OrderUIState>(
              builder: (context, orderState) {
                final requisition = state.requisitions.firstWhere((requisition) => requisition["id"] == orderState.selectedOrder["requisition"]);
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          Text(
                            "Purchase Order -  ${orderState.selectedOrder["id"]}",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Created on ${orderState.selectedOrder["createdAt"].split("T")[0]}",
                            style: Theme.of(context).textTheme.title3B,
                          ),
                          const SizedBox(height: 15),
                          Divider(
                            color: Colors.black.withOpacity(0.54),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Shipping Address",
                                    style: Theme.of(context).textTheme.bodyB,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    orderState.selectedOrder["shippingAddress"],
                                    style: Theme.of(context).textTheme.body,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Supplier Address",
                                    style: Theme.of(context).textTheme.bodyB,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    orderState.selectedOrder["supplierAddress"],
                                    style: Theme.of(context).textTheme.body,
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delivery Method",
                                    style: Theme.of(context).textTheme.bodyB,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    orderState.selectedOrder["deliveryMethod"] ?? "Truck",
                                    style: Theme.of(context).textTheme.body,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Delivery Date",
                                    style: Theme.of(context).textTheme.bodyB,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    DateTime.parse(orderState.selectedOrder["createdAt"]).add(const Duration(days: 3)).toIso8601String().split("T")[0],
                                    style: Theme.of(context).textTheme.body,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                      Text(
                        "Notes",
                        style: Theme.of(context).textTheme.bodyB,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        orderState.selectedOrder["notes"],
                        style: Theme.of(context).textTheme.body,
                      ),
                      const SizedBox(height: 15),
                      Divider(
                        color: Colors.black.withOpacity(0.54),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "Approved By",
                        style: Theme.of(context).textTheme.bodyB,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        orderState.selectedOrder["approvedBy"] != null ? orderState.selectedOrder["approvedBy"]["name"] : "shifan611@gmail.com",
                        style: Theme.of(context).textTheme.body,
                      ),
                      const SizedBox(height: 15),
                      BlocBuilder<RequisitionUIBloc, RequisitionUIState>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text('Items', style: Theme.of(context).textTheme.bodySB),
                                  const Spacer(),
                                  Text('Quantity', style: Theme.of(context).textTheme.bodySB),
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
                                        Text(item["item"], style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5))),
                                        const Spacer(),
                                        Text("1", style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5))),
                                        const Spacer(),
                                        Text("LKR ${item["amount"]}", style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5))),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              Row(
                                children: [
                                  Text('Total', style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5))),
                                  const Spacer(),
                                  Text(reduce(requisition["items"], (acc, curr, index){
                                    acc += int.parse(curr["amount"]);
                                    return acc;
                                  }, 0).toString(), style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5))),
                                ],
                              ),
                              const SizedBox(height: 30),
                              if (state.selectedRequisition["status"] == "pending")
                                Column(
                                  children: [
                                    CustomButton(
                                      text: "Pay Now",
                                      onPressed: () {
                                        context.read<OrderUIBloc>().add(MakePayment(orderState.selectedOrder));
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    CustomButton(
                                      text: "Delete",
                                      color: Colors.red,
                                      onPressed: () async {
                                        await OrderService.delete(Order.fromJSON(orderState.selectedOrder));
                                        context.read<OrderUIBloc>().add(const LoadOrders());
                                        Navigator.pushNamed(context, '/order-list');
                                      },
                                    ),
                                  ],
                                ),
                              const SizedBox(height: 30),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
