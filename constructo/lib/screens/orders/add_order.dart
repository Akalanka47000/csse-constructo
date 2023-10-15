import 'package:constructo/components/common/common.dart';
import 'package:constructo/config/themes/text.dart';
import 'package:constructo/state/ui/delivery/delivery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrder extends StatelessWidget {
  const AddOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text(args?["delivery"] != null ? "Edit Delivery Receipt" : 'New Delivery'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              BlocBuilder<DeliveryUIBloc, DeliveryUIState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownInput(placeholder: "Select Requisition Approval", items: state.suppliers),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: CustomButton(
                          text: "GENERATE PO NUMBER",
                          onPressed: () {
                            Navigator.pushNamed(context, '/view-delivery');
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      DropdownInput(placeholder: "Select Shipping Address", items: state.suppliers),
                      const SizedBox(height: 20),
                      DropdownInput(placeholder: "Select Supplier Address", items: state.suppliers),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text('Select Items', style: Theme.of(context).textTheme.bodySB),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 20),
                      for (dynamic item in state.selectedItems)
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: DropdownInput(placeholder: "Select", items: state.items, value: item["item"])),

                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    context.read<DeliveryUIBloc>().add(RemoveDeliveryItem(item));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(500),
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child: const Icon(Icons.close, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              const Divider(color: Colors.black),
                              SizedBox(
                                width: 150,
                                child: CustomButton(
                                  text: "NEW",
                                  prefixIcon: Icons.add,
                                  onPressed: () {
                                    context.read<DeliveryUIBloc>().add(const AddDeliveryItem({
                                          "item": null,
                                          "supplier": null,
                                          "amount": 1,
                                        }));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Notes",
                        ),
                        maxLines: 4,
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        text: "CREATE PURCHASE ORDER",
                        onPressed: () {
                          Navigator.pushNamed(context, '/view-order');
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
