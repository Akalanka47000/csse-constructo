import 'package:constructo/models/requisition.dart';
import 'package:constructo/models/general/success_message.dart';
import '../models/general/error_message.dart';
import 'core/firestore_service.dart';

class RequisitionService {
  static Future<List<Requisition>>? getRequisitions({dynamic filters}) async {
    List<dynamic> sorts = [
      {'name': 'created_at', 'descending': true}
    ];
    final responseDocs = await FirestoreService.read('requisitions', filters ?? [], sorts: sorts);
    List<Requisition> requisitions = [];
    for (dynamic responseDoc in responseDocs) {
      requisitions.add(Requisition.fromDocumentSnapshot(responseDoc));
    }
    return requisitions;
  }

  static Future<dynamic>? create(Requisition requisition) async {
    final res = await FirestoreService.write(
      'requisitions',
      requisition.toJSON(),
      'Order placed successfully',
    );
    if (res is SuccessMessage) {
      return res;
    }
    return ErrorMessage('Sorry, unable to place this requisition');
  }

  static Future<dynamic> update(Requisition requisition) async {
    final res = await FirestoreService.update(
      'requisitions',
      [
        {'name': 'id', 'operator': '==', 'value': requisition.id}
      ],
      requisition.toJSON(),
    );
    if (res is SuccessMessage) {
      return res;
    }
    return ErrorMessage('Sorry, unable to update this requisition');
  }

  static Future<dynamic> delete(Requisition requisition) async {
    final res = await FirestoreService.delete(
      'requisitions',
      [
        {'name': 'id', 'operator': '==', 'value': requisition.id}
      ],
    );
    if (res is SuccessMessage) {
      return res;
    }
    return ErrorMessage('Sorry, unable to delete this requisition');
  }
}
