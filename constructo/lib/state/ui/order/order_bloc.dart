import 'package:constructo/services/order_service.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shortid/shortid.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/order.dart';
import '../../../models/requisition.dart';
import '../../../services/requisition_service.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderUIBloc extends HydratedBloc<OrderUIEvent, OrderUIState> {
  OrderUIBloc() : super(OrderUIState()) {
    on<LoadOrders>((event, emit) async {
      final orders = await OrderService.getOrders();
      emit(state.copyWith(orders: orders));
    });
    on<GenerateOrderNumber>((event, emit) {
      final no = shortid.generate();
      emit(state.copyWith(orderNumber: no));
    });
    on<SetSupplierAddress>((event, emit) {
      emit(state.copyWith(supplierAddress: event.address));
    });
    on<SetShippingAddress>((event, emit) {
      emit(state.copyWith(shippingAddress: event.address));
    });
    on<SetNotes>((event, emit) {
      emit(state.copyWith(notes: event.notes));
    });
    on<SubmitOrder>((event, emit) async {
      final order = {
        'id': state.orderNumber,
        'supplierAddress': state.supplierAddress,
        'shippingAddress': state.shippingAddress,
        'requisition': state.selectedRequisition["id"],
        'notes': state.notes,
        'status': 'pending',
        'createdAt': DateTime.now().toIso8601String(),
      };
      emit(state.copyWith(
        orders: [
          ...state.orders,
          order
        ],
        supplierAddress: '',
        shippingAddress: '',
        selectedRequisition: {},
        orderNumber: '',
        selectedOrder: order,
      ));
      await OrderService.create(Order.fromJSON(order));
    });
    on<SetSelectedRequisition>((event, emit) {
      emit(state.copyWith(selectedRequisition: event.requisition));
    });
    on<SetSelectedOrder>((event, emit) {
      emit(state.copyWith(selectedOrder: event.order));
    });
    on<MakePayment>((event, emit) async {
      launchUrl(Uri.parse("https://buy.stripe.com/test_dR63d51od7Do7HW145"));
      final order = event.order;
      final updatedOrder = {
        ...order,
        'status': 'paid',
      };
      await OrderService.update(Order.fromJSON(updatedOrder));
      emit(state.copyWith(selectedOrder: updatedOrder));
    });
  }

  @override
  OrderUIState? fromJson(Map<String, dynamic> json) {
    return state.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(OrderUIState state) {
    return state.toJson(state);
  }
}
