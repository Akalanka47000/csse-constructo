import 'package:constructo/components/common/common.dart';
import 'package:constructo/config/themes/text.dart';
import 'package:constructo/services/requisition_service.dart';
import 'package:constructo/state/ui/requisition/requisition_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/common/core/buttons/custom_button.dart';
import '../../models/requisition.dart';

class ViewRequisition extends StatelessWidget {
  ViewRequisition({super.key});

  TextEditingController siteNameController = TextEditingController();
  TextEditingController siteLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constructo Express'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: BlocBuilder<RequisitionUIBloc, RequisitionUIState>(
            builder: (context, state) {
              return Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Text('Requisition Details', style: Theme.of(context).textTheme.title3B),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.black),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Text('REQ ${state.selectedRequisition["id"]}', style: Theme.of(context).textTheme.title3B),
                          const Spacer(),
                          Text(DateTime.now().toIso8601String().split("T")[0], style: Theme.of(context).textTheme.title3B),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Text('Req Status: ${state.selectedRequisition["status"].toUpperCase()}', style: Theme.of(context).textTheme.title3B),
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
                            controller: siteNameController..text = state.selectedRequisition["siteName"],
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            decoration: const InputDecoration(
                              labelText: "Site Location",
                            ),
                            controller: siteLocationController..text = state.selectedRequisition["siteLocation"],
                            onChanged: (value) {},
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text('Item', style: Theme.of(context).textTheme.bodySB),
                              const Spacer(),
                              Text('Supplier', style: Theme.of(context).textTheme.bodySB),
                              const Spacer(),
                              Text('Amount', style: Theme.of(context).textTheme.bodySB),
                            ],
                          ),
                          const SizedBox(height: 20),
                          for (dynamic item in state.selectedRequisition["items"])
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(item["item"], style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5), fontStyle: FontStyle.italic)),
                                    const Spacer(),
                                    Text(item["supplier"], style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5), fontStyle: FontStyle.italic)),
                                    const Spacer(),
                                    Text("LKR ${item["amount"]}", style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5), fontStyle: FontStyle.italic)),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          const SizedBox(height: 20),
                          Text('NOTES', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontStyle: FontStyle.italic)),
                          const SizedBox(height: 20),
                          Text(state.selectedRequisition["notes"], style: Theme.of(context).textTheme.caption2.copyWith(fontStyle: FontStyle.italic), textAlign: TextAlign.center),
                          const SizedBox(height: 30),
                          if (state.selectedRequisition["status"] == "pending")
                            Column(
                              children: [
                                CustomButton(
                                  text: "Request for Approval",
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                const SizedBox(height: 20),
                                CustomButton(
                                  text: "Delete",
                                  color: Colors.red,
                                  onPressed: () async {
                                    await RequisitionService.delete(Requisition.fromJSON(state.selectedRequisition));
                                    context.read<RequisitionUIBloc>().add(const LoadRequisitions());
                                    Navigator.pushNamed(context, '/requisition-list');
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
              );
            },
          ),
        ),
      ),
    );
  }
}
