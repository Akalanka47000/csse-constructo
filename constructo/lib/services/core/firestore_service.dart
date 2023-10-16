import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:constructo/models/general/error_message.dart';
import 'package:constructo/models/general/success_message.dart';

import '../../constants/main.dart';

class FirestoreService {
  static Future<dynamic> write(String collection, dynamic payload, String successMessage) async {
    dynamic res;
    CollectionReference collectionRef = FirebaseFirestore.instance.collection(collection);
    await collectionRef.add(payload).then((value) {
      res = SuccessMessage(successMessage);
    }).catchError((error) {;
      res = ErrorMessage(Constants.errorMessages['default']!);
    });
    return res;
  }

  static Future<dynamic> read(String collection, List<dynamic> filters, {limit, sorts}) async {
    List<dynamic> data = [];
    dynamic collectionRef = _filteredCollectionRef(collection, filters, sorts: sorts);
    if (limit != null) collectionRef = collectionRef.limit(limit);
    await collectionRef.get().then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) data = querySnapshot.docs;
    });
    return limit == 1 ? (data.isNotEmpty ? data[0] : null) : data;
  }

  static Future<dynamic> update(String collection, List<dynamic> filters, dynamic payload) async {
    dynamic res;
    dynamic collectionRef = _filteredCollectionRef(collection, filters);
    await collectionRef.get().then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        FirebaseFirestore.instance.collection(collection).doc(element.id).update(payload).catchError((error) {
          res = ErrorMessage(Constants.errorMessages['default']!);
        });
      }
      if (res.runtimeType != ErrorMessage) {
        res = SuccessMessage('Updated successfully');
      }
    }).catchError((error) {
      res = ErrorMessage(Constants.errorMessages['default']!);
    });
    return res;
  }

  static Future<dynamic> delete(String collection, List<dynamic> filters) async {
    dynamic res;
    dynamic collectionRef = _filteredCollectionRef(collection, filters);
    await collectionRef.get().then((QuerySnapshot querySnapshot) {
      for (var element in querySnapshot.docs) {
        FirebaseFirestore.instance.collection(collection).doc(element.id).delete().catchError((error) {
          res = ErrorMessage(Constants.errorMessages['default']!);
        });
      }
      if (res.runtimeType != ErrorMessage) {
        res = SuccessMessage('Deleted successfully');
      }
    }).catchError((error) {
      res = ErrorMessage(Constants.errorMessages['default']!);
    });
    return res;
  }

  static dynamic _filteredCollectionRef(String collection, List<dynamic> filters, {sorts}) {
    sorts ??= [];
    dynamic collectionRef = FirebaseFirestore.instance.collection(collection);
    for (var filter in filters) {
      collectionRef = collectionRef.where(filter['name'], isEqualTo: filter['value']);
    }
    sorts.forEach((sort) {
      collectionRef = collectionRef.orderBy(sort['name'], descending: sort['descending']);
    });
    return collectionRef;
  }

  static Future<dynamic> queryTimestampAndStatus(String collection, String fieldName, Duration timePeriodPassed, String status) async {
    List<dynamic> data = [];
    DateTime someTimeAgo = DateTime.now().subtract(timePeriodPassed);
    dynamic collectionRef = FirebaseFirestore.instance.collection(collection);
    collectionRef = collectionRef.where('status', isEqualTo: status).where(fieldName, isLessThan: someTimeAgo);
    await collectionRef.get().then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) data = querySnapshot.docs;
    });
    return data;
  }
}
