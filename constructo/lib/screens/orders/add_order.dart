import 'package:constructo/components/common/common.dart';
import 'package:constructo/config/themes/text.dart';
import 'package:constructo/state/ui/delivery/delivery_bloc.dart';
import 'package:constructo/state/ui/order/order_bloc.dart' as order_bloc;
import 'package:flodash/modules/collection/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../state/ui/requisition/requisition_bloc.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({super.key});

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<RequisitionUIBloc>(context).add(const LoadRequisitions());
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    return BlocBuilder<RequisitionUIBloc, RequisitionUIState>(
      builder: (context, state) {
        return BlocBuilder<order_bloc.OrderUIBloc, order_bloc.OrderUIState>(
          builder: (context, orderState) {
            return Scaffold(
              appBar: AppBar(
                title: Text(args?["order"] != null ? "Edit Order" : 'New Order'),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DropdownInput(
                            placeholder: "Select Requisition Approval",
                            items: filter(state.requisitions, (e) {
                              return e["status"] == "approved";
                            }).map((e) => e["id"]).toList(),
                            value: orderState.selectedRequisition["id"],
                            onChange: (value) {
                              final requisition = state.requisitions.firstWhere((element) => element["id"] == value);
                              context.read<order_bloc.OrderUIBloc>().add(order_bloc.SetSelectedRequisition(requisition));
                              context.read<order_bloc.OrderUIBloc>().add(order_bloc.SetSupplierAddress(requisition["siteLocation"]));
                            },
                          ),
                          const SizedBox(height: 20),
                          if (orderState.orderNumber == "")
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: CustomButton(
                                text: "GENERATE PO NUMBER",
                                onPressed: () {
                                  context.read<order_bloc.OrderUIBloc>().add(const order_bloc.GenerateOrderNumber());
                                },
                              ),
                            ),
                          if (orderState.orderNumber != "") Text("Order Number: ${orderState.orderNumber}", style: Theme.of(context).textTheme.bodySB),
                          const SizedBox(height: 20),
                          TextField(
                            decoration: const InputDecoration(
                              labelText: "Enter Shipping Address",
                            ),
                            onChanged: (value) {
                              context.read<order_bloc.OrderUIBloc>().add(order_bloc.SetShippingAddress(value));
                            },
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Supplier Address",
                            style: Theme.of(context).textTheme.bodyB,
                          ),
                          const SizedBox(height: 15),
                          Text(
                            orderState.supplierAddress,
                            style: Theme.of(context).textTheme.body,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text('Selected Items', style: Theme.of(context).textTheme.bodySB),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 20),
                          if (orderState.selectedRequisition["items"] != null)
                            for (dynamic item in orderState.selectedRequisition["items"])
                              Text(
                                "• ${item["item"]}",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                          const SizedBox(height: 20),
                          TextField(
                            decoration: const InputDecoration(
                              labelText: "Notes",
                            ),
                            maxLines: 4,
                            onChanged: (value) {
                              context.read<order_bloc.OrderUIBloc>().add(order_bloc.SetNotes(value));
                            },
                          ),
                          const SizedBox(height: 30),
                          CustomButton(
                            text: "CREATE PURCHASE ORDER",
                            onPressed: () {
                              context.read<order_bloc.OrderUIBloc>().add(const order_bloc.SubmitOrder());
                              Navigator.pushNamed(context, '/view-order');
                            },
                          ),
                          const SizedBox(height: 30),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
