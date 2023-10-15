import 'package:constructo/components/common/common.dart';
import 'package:constructo/config/themes/text.dart';
import 'package:constructo/state/ui/delivery/delivery_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDelivery extends StatelessWidget {
  const AddDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text(args?["delivery"] !=null ? "Edit Delivery Receipt" : 'New Delivery'),
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
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "PO Reference Number",
                        ),
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 20),
                      DropdownInput(placeholder: "Supplier", items: state.suppliers),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text('Item', style: Theme.of(context).textTheme.bodySB),
                          const Spacer(),
                          Text('Amount', style: Theme.of(context).textTheme.bodySB),
                          const SizedBox(width: 60),
                        ],
                      ),
                      const SizedBox(height: 20),
                      for (dynamic item in state.selectedItems)
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: DropdownInput(placeholder: "Item", items: state.items, value: item["item"])),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      labelText: "Amount",
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {},
                                  ),
                                ),
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
                                    padding:  const EdgeInsets.all(5),
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
                              GestureDetector(
                                  onTap: () {
                                    context.read<DeliveryUIBloc>().add(const AddDeliveryItem({
                                          "item": null,
                                          "supplier": null,
                                          "amount": 1,
                                        }));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(500),
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text('Discrepancies: NONE', style: Theme.of(context).textTheme.bodySB),
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
                        text: "SAVE",
                        onPressed: () {
                          Navigator.pushNamed(context, '/view-delivery');
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
