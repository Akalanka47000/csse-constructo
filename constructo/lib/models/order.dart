import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  final String id;
  final String supplierAddress;
  final String shippingAddress;
  final String requisition;
  final String notes;
  final String status;
  final String createdAt;

  Order(
      {required this.id,
      required this.supplierAddress,
      required this.shippingAddress,
      required this.requisition,
      required this.notes,
      required this.status,
      required this.createdAt});

  factory Order.fromDocumentSnapshot(dynamic doc) {
    return Order(
      id: doc.data()['id'],
      supplierAddress: doc.data()['supplierAddress'],
      shippingAddress: doc.data()['shippingAddress'],
      requisition: doc.data()['requisition'],
      notes: doc.data()['notes'],
      status: doc.data()['status'],
      createdAt: doc.data()['createdAt'],
    );
  }

  static fromJSON(dynamic json) {
    return Order(
      id: json['id'],
      supplierAddress: json['supplierAddress'],
      shippingAddress: json['shippingAddress'],
      requisition: json['requisition'],
      notes: json['notes'],
      status: json['status'],
      createdAt: json['createdAt'],
    );
  }

  toJSON() {
    return {
      'id': id,
      'supplierAddress': supplierAddress,
      'shippingAddress': shippingAddress,
      'requisition': requisition,
      'notes': notes,
      'status': status,
      'createdAt': createdAt,
    };
  }
}
