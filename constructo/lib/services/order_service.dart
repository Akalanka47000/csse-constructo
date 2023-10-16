import 'package:constructo/models/requisition.dart';
import 'package:constructo/models/general/success_message.dart';
import '../models/general/error_message.dart';
import '../models/order.dart';
import 'core/firestore_service.dart';

class OrderService {
  static Future<List<dynamic>>? getOrders({dynamic filters}) async {
    final responseDocs = await FirestoreService.read('orders', filters ?? [], sorts: []);
    List<dynamic> orders = [];
    for (dynamic responseDoc in responseDocs) {
      orders.add(Order.fromDocumentSnapshot(responseDoc).toJSON());
    }
    return orders;
  }

  static Future<dynamic>? create(Order order) async {
    final res = await FirestoreService.write(
      'orders',
      order.toJSON(),
      'Order placed successfully',
    );
    if (res is SuccessMessage) {
      return res;
    }
    return ErrorMessage('Sorry, unable to place this order');
  }

  static Future<dynamic> update(Order order) async {
    final res = await FirestoreService.update(
      'orders',
      [
        {'name': 'id', 'operator': '==', 'value': order.id}
      ],
      order.toJSON(),
    );
    if (res is SuccessMessage) {
      return res;
    }
    return ErrorMessage('Sorry, unable to update this order');
  }

  static Future<dynamic> delete(Order order) async {
    final res = await FirestoreService.delete(
      'orders',
      [
        {'name': 'id', 'operator': '==', 'value': order.id}
      ],
    );
    if (res is SuccessMessage) {
      return res;
    }
    return ErrorMessage('Sorry, unable to delete this order');
  }
}
