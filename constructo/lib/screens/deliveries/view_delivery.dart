import 'package:constructo/components/common/common.dart';
import 'package:constructo/config/themes/text.dart';
import 'package:constructo/state/ui/requisition/requisition_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/common/core/buttons/custom_button.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text('REQ ######', style: Theme.of(context).textTheme.title3B),
                  const SizedBox(height: 10),
                  Text(DateTime.now().toIso8601String().split("T")[0], style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 10),
                  Text('Supplier: ABCD Pvt Ltd', style: Theme.of(context).textTheme.bodyB),
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
                          Text('Head', style: Theme.of(context).textTheme.bodySB),
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
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        children: [
          const Spacer(),
          CustomButton(
            borderRadius: BorderRadius.circular(300),
            prefixIcon: Icons.edit,
            onPressed: () {
              Navigator.pushNamed(context, '/add-delivery', arguments: {'delivery': {}});
            },
          ),
        ],
      ),
    );
  }
}
