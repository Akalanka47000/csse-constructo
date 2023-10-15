part of 'delivery_bloc.dart';

abstract class DeliveryUIEvent {
  const DeliveryUIEvent();
}

class AddDeliveryItem extends DeliveryUIEvent {
  final Map<String, dynamic> item;
  const AddDeliveryItem(this.item);
}

class RemoveDeliveryItem extends DeliveryUIEvent {
  final dynamic item;
  const RemoveDeliveryItem(this.item);
}

class SaveDelivery extends DeliveryUIEvent {
  const SaveDelivery();
}

class SubmitDelivery extends DeliveryUIEvent {
  const SubmitDelivery();
}

class SetReference extends DeliveryUIEvent {
  final String reference;
  const SetReference(this.reference);
}

class SetSupplier extends DeliveryUIEvent {
  final String supplier;
  const SetSupplier(this.supplier);
}

class SetNotes extends DeliveryUIEvent {
  final String notes;
  const SetNotes(this.notes);
}