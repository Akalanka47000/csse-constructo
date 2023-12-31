import 'package:constructo/config/themes/text.dart';
import 'package:constructo/state/ui/requisition/requisition_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/core/buttons/custom_button.dart';

class RequisitionCard extends StatelessWidget {
  final String id;
  final DateTime date;
  final String status;
  final List<String> items;
  final dynamic requisition;
  const RequisitionCard({Key? key, required this.id, required this.date, required this.status, required this.items, this.requisition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text('REQ $id', style: Theme.of(context).textTheme.title3B),
              const Spacer(),
              Text(date.toIso8601String().split("T")[0], style: Theme.of(context).textTheme.bodySB),
            ],
          ),
          const SizedBox(height: 20),
          for (var item in items) Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                Text(item, style: Theme.of(context).textTheme.bodySB),
              ],
            ),
          ),
          Row(
            children: [
              Text(status, style: Theme.of(context).textTheme.bodySB),
              const Spacer(),
              CustomButton(
                text: "Details",
                onPressed: () {
                  context.read<RequisitionUIBloc>().add(SetSelectedRequisition(requisition));
                  Navigator.pushNamed(context, '/view-requisition');
                },
                padding: const EdgeInsets.all(12),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
