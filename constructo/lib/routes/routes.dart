import 'package:constructo/screens/home.dart';
import 'package:constructo/screens/requisitions/add_requisition.dart';
import 'package:page_transition/page_transition.dart';
import '../screens/auth/login.dart';
import '../screens/profile.dart';

class Routes {
  static const login = '/login';
  static const profile = '/profile';
  static const home = '/home';
  static const addRequisition = '/add-requisition';

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
      default:
        return null;
    }
  }
}
