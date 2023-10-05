part of 'requisition_bloc.dart';

class RequisitionUIState extends Equatable {
  late final List<String> items;
  late final List<String> suppliers;
  late final String siteName;
  late final String siteLocation;
  late final String notes;
  late final String status;

  List<Map<String, dynamic>> selectedItems = [{
  "item": "",
  "supplier": "",
  "amount": 1,
  }];

  RequisitionUIState({List<String>? items, List<String>? suppliers, String? siteName, String? siteLocation, String? notes, List<Map<String, dynamic>>? selectedItems, String? status}) {
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
    this.siteName = siteName ?? '';
    this.siteLocation = siteLocation ?? '';
    this.notes = notes ?? '';
    this.selectedItems = selectedItems ?? const [
      {
        "item": null,
        "supplier": null,
        "amount": 1,
      }
    ];
    this.status = 'pending';
  }

  RequisitionUIState copyWith({List<String>? items, List<String>? suppliers, String? siteName, String? siteLocation, String? notes, List<Map<String, dynamic>>? selectedItems, String? status}) => RequisitionUIState(
        items: items ?? this.items,
        suppliers: suppliers ?? this.suppliers,
        siteName: siteName ?? this.siteName,
        siteLocation: siteLocation ?? this.siteLocation,
        notes: notes ?? this.notes,
        selectedItems: selectedItems ?? this.selectedItems,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [items, suppliers, siteName, siteLocation, notes, selectedItems, status];
}
