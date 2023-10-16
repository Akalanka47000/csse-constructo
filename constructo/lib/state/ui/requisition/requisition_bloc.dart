import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'requisition_event.dart';
part 'requisition_state.dart';

class RequisitionUIBloc extends HydratedBloc<RequisitionUIEvent, RequisitionUIState> {
  RequisitionUIBloc() : super(RequisitionUIState()) {
    on<AddRequisitionItem>((event, emit) {
      emit(state.copyWith(selectedItems: [...state.selectedItems, event.item]));
    });
    on<RemoveRequisitionItem>((event, emit) {
      if (state.selectedItems.length == 1) return;
      emit(state.copyWith(selectedItems: [...state.selectedItems]..remove(event.item)));
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
    on<SubmitRequisition>((event, emit) {
      emit(state.copyWith(
        requisitions: [
          ...state.requisitions,
          {
            'siteName': state.siteName,
            'siteLocation': state.siteLocation,
            'notes': state.notes,
            'items': state.selectedItems,
            'status': state.status,
            'createdAt': DateTime.now(),
          }
        ],
        siteLocation: '',
        siteName: '',
        notes: '',
        selectedItems: [],
      ));
    });
  }

  @override
  RequisitionUIState? fromJson(Map<String, dynamic> json) {
    return state.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(RequisitionUIState state) {
    return state.toJson(state);
  }
}
