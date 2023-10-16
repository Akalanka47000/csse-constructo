import 'package:constructo/components/common/common.dart';
import 'package:constructo/config/themes/text.dart';
import 'package:constructo/state/ui/requisition/requisition_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/common/core/buttons/custom_button.dart';

class AddRequisition extends StatelessWidget {
  const AddRequisition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constructo Express'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Text('New Requisition', style: Theme.of(context).textTheme.title3B),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 25),
                ],
              ),
              BlocBuilder<RequisitionUIBloc, RequisitionUIState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Site Name",
                        ),
                        onChanged: (value) {
                          context.read<RequisitionUIBloc>().add(SetSiteName(value));
                        },
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Site Location",
                        ),
                        onChanged: (value) {
                          context.read<RequisitionUIBloc>().add(SetSiteLocation(value));
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text('Item', style: Theme.of(context).textTheme.bodySB),
                          const Spacer(),
                          Text('Supplier', style: Theme.of(context).textTheme.bodySB),
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
                                Expanded(
                                  child: DropdownInput(
                                    placeholder: "Item",
                                    items: state.items,
                                    value: item["item"],
                                    padding: const EdgeInsets.all(5),
                                    onChange: (value) {
                                      context.read<RequisitionUIBloc>().add(UpdateItem("item", value, item));
                                    }
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: DropdownInput(
                                    placeholder: "Supplier",
                                    items: state.suppliers,
                                    value: item["supplier"],
                                    padding: const EdgeInsets.all(5),
                                    onChange: (value) {
                                      context.read<RequisitionUIBloc>().add(UpdateItem("supplier", value, item));
                                    }
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      labelText: "Amount",
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      context.read<RequisitionUIBloc>().add(UpdateItem("amount", value, item));
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    context.read<RequisitionUIBloc>().add(RemoveRequisitionItem(item));
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
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const Divider(color: Colors.black),
                          GestureDetector(
                              onTap: () {
                                context.read<RequisitionUIBloc>().add(const AddRequisitionItem({
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
                      const SizedBox(height: 20),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Notes",
                        ),
                        maxLines: 4,
                        onChanged: (value) {
                          context.read<RequisitionUIBloc>().add(SetNotes(value));
                        },
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          CustomButton(
                            text: "SAVE DRAFT",
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          const Spacer(),
                          CustomButton(
                            text: "SUBMIT",
                            onPressed: () {
                              context.read<RequisitionUIBloc>().add(const SubmitRequisition());
                              Navigator.pushNamed(context, '/view-requisition');
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
        ),
      ),
    );
  }
}
