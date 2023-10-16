import 'package:flodash/flodash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shortid/shortid.dart';

import '../../../models/requisition.dart';
import '../../../services/requisition_service.dart';

part 'requisition_event.dart';
part 'requisition_state.dart';

class RequisitionUIBloc extends HydratedBloc<RequisitionUIEvent, RequisitionUIState> {
  RequisitionUIBloc() : super(RequisitionUIState()) {
    on<LoadRequisitions>((event, emit) async {
      final requisitions = await RequisitionService.getRequisitions();
      emit(state.copyWith(requisitions: requisitions));
    });
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
    on<SubmitRequisition>((event, emit) async {
      String status = state.status;
      final amount = reduce(state.selectedItems, (acc, curr, index) {
        acc += int.parse(curr["amount"]);
        return acc;
      }, 0);
      if (amount < 100000) {
        status = "approved";
      }
      final requisition = {
        'id': shortid.generate(),
        'siteName': state.siteName,
        'siteLocation': state.siteLocation,
        'notes': state.notes,
        'items': state.selectedItems,
        'status': status,
        'createdAt': DateTime.now().toIso8601String(),
      };
      emit(state.copyWith(
          requisitions: [...state.requisitions, requisition],
          siteLocation: '',
          siteName: '',
          notes: '',
          selectedItems: [
            {
              "item": null,
              "supplier": null,
              "amount": 1,
            }
          ],
          selectedRequisition: requisition));
      await RequisitionService.create(Requisition.fromJSON(requisition));
    });
    on<UpdateItem>((event, emit) {
      final updatedItem = {
        ...event.item,
        event.key: event.value,
      };
      dynamic selectedItems = state.selectedItems.map((e) {
        if (mapEquals(e, event.item)) {
          return updatedItem;
        }
        return e;
      }).toList();
      emit(state.copyWith(selectedItems: selectedItems));
    });
    on<SetSelectedRequisition>((event, emit) {
      emit(state.copyWith(selectedRequisition: event.requisition));
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
