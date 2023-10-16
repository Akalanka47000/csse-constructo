class Requisition {
  String? id = '';
  final String siteName;
  final String siteLocation;
  final String notes;
  final String status;
  final List<dynamic> items;
  final String createdAt;

  Requisition({required this.id, required this.siteName, required this.siteLocation, required this.notes, required this.status, required this.items, required this.createdAt});

  factory Requisition.fromDocumentSnapshot(dynamic doc) {
    return Requisition(
      id: doc.data()['id'],
      siteName: doc.data()['siteName'],
      siteLocation: doc.data()['siteLocation'],
      notes: doc.data()['notes'],
      status: doc.data()['status'],
      items: doc.data()['items'],
      createdAt: doc.data()['createdAt'],
    );
  }

  static fromJSON(dynamic json) {
    return Requisition(
      id: json['id'],
      siteName: json['siteName'],
      siteLocation: json['siteLocation'],
      notes: json['notes'],
      status: json['status'],
      items: json['items'],
      createdAt: json['createdAt'],
    );
  }

  toJSON() {
    return {
      'id': id,
      'siteName': siteName,
      'siteLocation': siteLocation,
      'notes': notes,
      'status': status,
      'items': items,
      'createdAt': createdAt,
    };
  }
}
