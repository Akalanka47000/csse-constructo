part of 'requisition_bloc.dart';

abstract class RequisitionUIEvent {
  const RequisitionUIEvent();
}

class LoadRequisitions extends RequisitionUIEvent {
  const LoadRequisitions();
}

class AddRequisitionItem extends RequisitionUIEvent {
  final Map<String, dynamic> item;
  const AddRequisitionItem(this.item);
}

class RemoveRequisitionItem extends RequisitionUIEvent {
  final dynamic item;
  const RemoveRequisitionItem(this.item);
}

class UpdateItem extends RequisitionUIEvent {
  final String key;
  final String value;
  final dynamic item;
  const UpdateItem(this.key, this.value, this.item);
}

class SaveDraft extends RequisitionUIEvent {
  const SaveDraft();
}

class SubmitRequisition extends RequisitionUIEvent {
  const SubmitRequisition();
}

class SetSiteName extends RequisitionUIEvent {
  final String siteName;
  const SetSiteName(this.siteName);
}

class SetSiteLocation extends RequisitionUIEvent {
  final String siteLocation;
  const SetSiteLocation(this.siteLocation);
}

class SetNotes extends RequisitionUIEvent {
  final String notes;
  const SetNotes(this.notes);
}

class SetSelectedRequisition extends RequisitionUIEvent {
  final dynamic requisition;
  const SetSelectedRequisition(this.requisition);
}
