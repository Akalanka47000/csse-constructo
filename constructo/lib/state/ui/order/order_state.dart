part of 'order_bloc.dart';

class OrderUIState extends Equatable {
  late final List<dynamic> orders;
  late final String orderNumber;
  late final String supplierAddress;
  late final String shippingAddress;
  late final String notes;
  late final dynamic selectedRequisition;
  late final dynamic selectedOrder;

  OrderUIState({List<dynamic>? orders, String? orderNumber, String? supplierAddress, String? shippingAddress, String? notes, dynamic selectedRequisition, dynamic selectedOrder}) {
    this.orders = orders ?? const [];
    this.orderNumber = orderNumber ?? '';
    this.supplierAddress = supplierAddress ?? '';
    this.shippingAddress = shippingAddress ?? '';
    this.notes = notes ?? '';
    this.selectedRequisition = selectedRequisition ?? {};
    this.selectedOrder = selectedOrder ?? {};
  }

  OrderUIState copyWith({List<dynamic>? orders, String? orderNumber, String? supplierAddress, String? shippingAddress, String? notes, dynamic selectedRequisition, dynamic selectedOrder}) => OrderUIState(
        orders: orders ?? this.orders,
        orderNumber: orderNumber ?? this.orderNumber,
        supplierAddress: supplierAddress ?? this.supplierAddress,
        shippingAddress: shippingAddress ?? this.shippingAddress,
        notes: notes ?? this.notes,
        selectedRequisition: selectedRequisition ?? this.selectedRequisition,
        selectedOrder: selectedOrder ?? this.selectedOrder,
      );

  @override
  List<Object> get props => [orders, orderNumber, supplierAddress, shippingAddress, notes, selectedRequisition, selectedOrder];

  @override
  OrderUIState? fromJson(Map<String, dynamic> json) {
    return copyWith(
      orders: json['orders'],
      orderNumber: json['orderNumber'],
      supplierAddress: json['supplierAddress'],
      shippingAddress: json['shippingAddress'],
      notes: json['notes'],
      selectedRequisition: json['selectedRequisition'],
      selectedOrder: json['selectedOrder'],
    );
  }

  @override
  Map<String, dynamic>? toJson(OrderUIState state) {
    return {
      'orders': state.orders,
      'orderNumber': state.orderNumber,
      'supplierAddress': state.supplierAddress,
      'shippingAddress': state.shippingAddress,
      'notes': state.notes,
      'selectedRequisition': state.selectedRequisition,
      'selectedOrder': state.selectedOrder,
    };
  }
}
