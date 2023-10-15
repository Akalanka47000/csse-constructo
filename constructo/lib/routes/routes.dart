import 'package:constructo/screens/home.dart';
import 'package:constructo/screens/requisitions/add_requisition.dart';
import 'package:constructo/screens/requisitions/requisition_list.dart';
import 'package:constructo/screens/requisitions/view_requisition.dart';
import 'package:page_transition/page_transition.dart';
import '../screens/auth/login.dart';
import '../screens/deliveries/add_delivery.dart';
import '../screens/deliveries/delivery_list.dart';
import '../screens/deliveries/view_delivery.dart';
import '../screens/orders/add_order.dart';
import '../screens/orders/order_list.dart';
import '../screens/orders/view_order.dart';
import '../screens/profile.dart';

class Routes {
  static const login = '/login';
  static const profile = '/profile';
  static const home = '/home';
  static const addRequisition = '/add-requisition';
  static const viewRequisition = '/view-requisition';
  static const requisitionList = '/requisition-list';
  static const addDelivery = '/add-delivery';
  static const viewDelivery = '/view-delivery';
  static const deliveryList = '/delivery-list';
  static const addOrder = '/add-order';
  static const viewOrder = '/view-order';
  static const orderList = '/order-list';

  static PageTransition? onGenerateRoute(route) {
    switch (route.name) {
      case login:
        return PageTransition(child: const Login(), type: PageTransitionType.fade);
      case profile:
        return PageTransition(child: const Profile(), type: PageTransitionType.fade);
      case home:
        return PageTransition(child: const Home(), type: PageTransitionType.fade);
      case addRequisition:
        return PageTransition(child: const AddRequisition(), type: PageTransitionType.fade);
      case viewRequisition:
        return PageTransition(child: const ViewRequisition(), type: PageTransitionType.fade);
      case requisitionList:
        return PageTransition(child: const RequisitionList(), type: PageTransitionType.fade);
      case addDelivery:
        return PageTransition(child: const AddDelivery(), type: PageTransitionType.fade);
      case viewDelivery:
        return PageTransition(child: const ViewDelivery(), type: PageTransitionType.fade);
      case deliveryList:
        return PageTransition(child: const DeliveryList(), type: PageTransitionType.fade);
      case addOrder:
        return PageTransition(child: const AddOrder(), type: PageTransitionType.fade);
      case viewOrder:
        return PageTransition(child: const ViewOrder(), type: PageTransitionType.fade);
      case orderList:
        return PageTransition(child: const OrderList(), type: PageTransitionType.fade);
      default:
        return null;
    }
  }
}
