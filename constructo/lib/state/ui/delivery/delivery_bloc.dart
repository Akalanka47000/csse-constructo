import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'delivery_event.dart';
part 'delivery_state.dart';

class DeliveryUIBloc extends Bloc<DeliveryUIEvent, DeliveryUIState> {
  DeliveryUIBloc() : super(DeliveryUIState()) {
    on<AddDeliveryItem>((event, emit) {
      emit(state.copyWith(selectedItems:
        [...state.selectedItems, event.item]
      ));
    });
    on<RemoveDeliveryItem>((event, emit) {
      if (state.selectedItems.length == 1) return;
      emit(state.copyWith(selectedItems:
        [...state.selectedItems]..remove(event.item)
      ));
    });
    on<SetReference>((event, emit) {
      emit(state.copyWith(reference: event.reference));
    });
    on<SetSupplier>((event, emit) {
      emit(state.copyWith(supplier: event.supplier));
    });
    on<SetNotes>((event, emit) {
      emit(state.copyWith(notes: event.notes));
    });
  }
}
