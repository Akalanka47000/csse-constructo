import 'package:constructo/components/common/common.dart';
import 'package:constructo/config/themes/text.dart';
import 'package:constructo/state/ui/requisition/requisition_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/common/core/buttons/custom_button.dart';

class ViewRequisition extends StatelessWidget {
  const ViewRequisition({super.key});

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
                      Text('Requisition Details', style: Theme.of(context).textTheme.title3B),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Text('REQ ######', style: Theme.of(context).textTheme.title3B),
                      const Spacer(),
                      Text(DateTime.now().toIso8601String().split("T")[0], style: Theme.of(context).textTheme.title3B),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text('Req Status: PENDING', style: Theme.of(context).textTheme.title3B),
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
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Site Location",
                        ),
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
                      for (dynamic item in state.selectedItems)
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('Item#', style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5), fontStyle: FontStyle.italic)),
                                const Spacer(),
                                Text('Supplier#', style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5), fontStyle: FontStyle.italic)),
                                const Spacer(),
                                Text('##', style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5), fontStyle: FontStyle.italic)),
                              ],
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      const SizedBox(height: 20),
                      Text('NOTES', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontStyle: FontStyle.italic)),
                      const SizedBox(height: 20),
                      Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, diam quis aliquam lacinia, nisl nunc aliquet nunc, quis aliquam nisl nunc quis nisl..', style: Theme.of(context).textTheme.caption2.copyWith(fontStyle: FontStyle.italic), textAlign: TextAlign.center),
                      const SizedBox(height: 30),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Notes",
                        ),
                        maxLines: 4,
                        onChanged: (value) {},
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        "Request for Approval",
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          CustomButton(
                            "SAVE DRAFT",
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          const Spacer(),
                          CustomButton(
                            "SUBMIT",
                            onPressed: () {
                              Navigator.of(context).pop();
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
