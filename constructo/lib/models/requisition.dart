class Requisition {
  String id = '';
  final String siteName;
  final String siteLocation;
  final String notes;
  final String status;
  final List<dynamic> items;

  Requisition({required this.id, required this.siteName, required this.siteLocation, required this.notes, required this.status, required this.items});

  factory Requisition.fromDocumentSnapshot(dynamic doc) {
    return Requisition(
      id: doc.data()['id'],
      siteName: doc.data()['site_name'],
      siteLocation: doc.data()['site_location'],
      notes: doc.data()['notes'],
      status: doc.data()['status'],
      items: doc.data()['items'],
    );
  }

  toJSON() {
    return {
      'id': id,
      'site_name': siteName,
      'site_location': siteLocation,
      'notes': notes,
      'status': status,
      'items': items,
    };
  }
}
