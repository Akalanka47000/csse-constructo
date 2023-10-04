import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'requisition_event.dart';
part 'requisition_state.dart';

class RequisitionUIBloc extends Bloc<RequisitionUIEvent, RequisitionUIState> {
  RequisitionUIBloc() : super(RequisitionUIState()) {
    on<AddRequisitionItem>((event, emit) {
      emit(state.copyWith(selectedItems:
        [...state.selectedItems, event.item]
      ));
    });
    on<RemoveRequisitionItem>((event, emit) {
      if (state.selectedItems.length == 1) return;
      emit(state.copyWith(selectedItems:
        [...state.selectedItems]..remove(event.item)
      ));
    });
    on<SetSiteName>((event, emit) {
      emit(state.copyWith(siteName: event.siteName));
    });
    on<SetSiteLocation>((event, emit) {
      emit(state.copyWith(siteLocation: event.siteLocation));
    });
    on<SetNotes>((event, emit) {
      emit(state.copyWith(notes: event.notes));
    });
  }
}
