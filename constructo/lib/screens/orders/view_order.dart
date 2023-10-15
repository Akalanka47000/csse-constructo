import 'package:constructo/components/common/common.dart';
import 'package:constructo/config/themes/text.dart';
import 'package:constructo/state/ui/requisition/requisition_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/common/core/buttons/custom_button.dart';

class ViewOrder extends StatelessWidget {
  const ViewOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Order'),
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
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "PURCHASE ORDER",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    enabled: false,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "CREATED AT",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    enabled: false,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: const InputDecoration(
                          labelText: "SHIPPING ADDRESS",
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {},
                      )),
                      const SizedBox(width: 20),
                      Expanded(
                          child: TextField(
                        decoration: const InputDecoration(
                          labelText: "SUPPLIER ADDRESS",
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {},
                      )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: const InputDecoration(
                          labelText: "DELIVERY METHOD",
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {},
                      )),
                      const SizedBox(width: 20),
                      Expanded(
                          child: TextField(
                        decoration: const InputDecoration(
                          labelText: "DELIVERY DATE",
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {},
                      )),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Notes",
                ),
                maxLines: 2,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: "APPROVED BY",
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              ),
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
                      for (dynamic item in state.selectedItems)
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('Item #', style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5))),
                                const Spacer(),
                                Text('Quantity', style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5))),
                                const Spacer(),
                                Text('Amount', style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5))),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      Row(
                        children: [
                          Text('Total', style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5))),
                          const Spacer(),
                          Text('Amount', style: Theme.of(context).textTheme.bodySB.copyWith(color: Colors.black.withOpacity(0.5))),
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
