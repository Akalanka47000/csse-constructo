import 'package:constructo/components/common/common.dart';
import 'package:constructo/components/requisistion/card.dart';
import 'package:constructo/models/requisition.dart';
import 'package:constructo/state/ui/requisition/requisition_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequisitionList extends StatefulWidget {
  const RequisitionList({Key? key}) : super(key: key);

  @override
  State<RequisitionList> createState() => _RequisitionListState();
}

class _RequisitionListState extends State<RequisitionList> {
  @override
  initState() {
    super.initState();
    BlocProvider.of<RequisitionUIBloc>(context).add(const LoadRequisitions());
  }

  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constructo Express'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<RequisitionUIBloc, RequisitionUIState>(
          buildWhen: (previous, current) => current.requisitions != previous.requisitions,
          builder: (context, state) {
            List  requisitions = state.requisitions;
            if (search.isNotEmpty) {
              requisitions = requisitions.where((requisition) {
                return requisition["id"].contains(search) || requisition["items"].map((item) => item['item']).toList().cast<String>().contains(search);
              }).toList();
            }
            return ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: "Date, item, REQ number",
                            ),
                            onChanged: (value) {
                              setState(() {
                                search = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CustomButton(
                            text: "SEARCH",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 25),
                  ],
                ),
                for (dynamic requisition in requisitions)
                  Column(
                    children: [
                      RequisitionCard(
                        id: requisition["id"],
                        date: DateTime.parse(requisition["createdAt"]),
                        status: requisition["status"].toUpperCase(),
                        items: requisition["items"].map((item) => item['item']).toList().cast<String>(),
                        requisition: requisition,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        children: [
          const Spacer(),
          CustomButton(
            text: "NEW",
            prefixIcon: Icons.add,
            onPressed: () {
              Navigator.pushNamed(context, '/add-requisition');
            },
          ),
        ],
      ),
    );
  }
}
