import 'package:constructo/models/requisition.dart';
import 'package:constructo/models/general/success_message.dart';
import '../models/general/error_message.dart';
import 'core/firestore_service.dart';

class DeliveryService {
  static Future<List<Requisition>>? getDeliveries({dynamic filters}) async {
    List<dynamic> sorts = [
      {'name': 'created_at', 'descending': true}
    ];
    final responseDocs = await FirestoreService.read('deliveries', filters ?? [], sorts: sorts);
    List<Requisition> deliveries = [];
    for (dynamic responseDoc in responseDocs) {
      deliveries.add(Requisition.fromDocumentSnapshot(responseDoc));
    }
    return deliveries;
  }

  static Future<dynamic>? create(Requisition delivery) async {
    final res = await FirestoreService.write(
      'deliveries',
      delivery.toJSON(),
      'delivery placed successfully',
    );
    if (res is SuccessMessage) {
      return res;
    }
    return ErrorMessage('Sorry, unable to place this delivery');
  }

  static Future<dynamic> update(Requisition delivery) async {
    final res = await FirestoreService.update(
      'deliveries',
      [
        {'name': 'id', 'operator': '==', 'value': delivery.id}
      ],
      delivery.toJSON(),
    );
    if (res is SuccessMessage) {
      return res;
    }
    return ErrorMessage('Sorry, unable to update this delivery');
  }

  static Future<dynamic> delete(Requisition delivery) async {
    final res = await FirestoreService.delete(
      'deliveries',
      [
        {'name': 'id', 'operator': '==', 'value': delivery.id}
      ],
    );
    if (res is SuccessMessage) {
      return res;
    }
    return ErrorMessage('Sorry, unable to delete this delivery');
  }
}
