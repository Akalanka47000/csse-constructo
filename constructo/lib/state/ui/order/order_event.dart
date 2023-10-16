part of 'order_bloc.dart';

abstract class OrderUIEvent {
  const OrderUIEvent();
}

class SubmitOrder extends OrderUIEvent {
  const SubmitOrder();
}

class LoadOrders extends OrderUIEvent {
  const LoadOrders();
}

class GenerateOrderNumber extends OrderUIEvent {
  const GenerateOrderNumber();
}

class SetSupplierAddress extends OrderUIEvent {
  final String address;
  const SetSupplierAddress(this.address);
}

class SetShippingAddress extends OrderUIEvent {
  final String address;
  const SetShippingAddress(this.address);
}

class SetNotes extends OrderUIEvent {
  final String notes;
  const SetNotes(this.notes);
}

class SetSelectedRequisition extends OrderUIEvent {
  final dynamic requisition;
  const SetSelectedRequisition(this.requisition);
}

class SetSelectedOrder extends OrderUIEvent {
  final dynamic order;
  const SetSelectedOrder(this.order);
}

class MakePayment extends OrderUIEvent {
  final dynamic order;
  const MakePayment(this.order);
}