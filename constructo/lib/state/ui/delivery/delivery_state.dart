part of 'delivery_bloc.dart';

class DeliveryUIState extends Equatable {
  late final List<String> items;
  late final List<String> suppliers;
  late final String reference;
  late final String supplier;
  late final String notes;

  List<Map<String, dynamic>> selectedItems = [{
  "item": "",
  "supplier": "",
  "amount": 1,
  }];

  DeliveryUIState({List<String>? items, List<String>? suppliers, String? reference, String? supplier, String? notes, List<Map<String, dynamic>>? selectedItems}) {
    this.items = items ?? const [
      "Sand",
      "Bricks",
      "Cement",
      "Steel",
      "Wood",
      "Tiles",
      "Paint",
      "Pipes",
    ];
    this.suppliers = suppliers ?? const [
      "R.Y",
      "E.M",
      "P.W",
      "T.C",
    ];
    this.reference = reference ?? '';
    this.supplier = supplier ?? '';
    this.notes = notes ?? '';
    this.selectedItems = selectedItems ?? const [
      {
        "item": null,
        "supplier": null,
        "amount": 1,
      }
    ];
  }

  DeliveryUIState copyWith({List<String>? items, List<String>? suppliers, String? reference, String? supplier, String? notes, List<Map<String, dynamic>>? selectedItems}) => DeliveryUIState(
        items: items ?? this.items,
        suppliers: suppliers ?? this.suppliers,
        reference: reference ?? this.reference,
        supplier: supplier ?? this.supplier,
        notes: notes ?? this.notes,
        selectedItems: selectedItems ?? this.selectedItems,
      );

  @override
  List<Object> get props => [items, suppliers, reference, supplier, notes, selectedItems];

  @override
  DeliveryUIState? fromJson(Map<String, dynamic> json) {
    return DeliveryUIState(
      items: json['items'],
      suppliers: json['suppliers'],
      reference: json['reference'],
      supplier: json['supplier'],
      notes: json['notes'],
      selectedItems: json['selectedItems'],
    );
  }

  @override
  Map<String, dynamic>? toJson(DeliveryUIState state) {
    return {
      'items': state.items,
      'suppliers': state.suppliers,
      'reference': state.reference,
      'supplier': state.supplier,
      'notes': state.notes,
      'selectedItems': state.selectedItems,
    };
  }
}
