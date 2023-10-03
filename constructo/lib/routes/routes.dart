import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:page_transition/page_transition.dart';
import '../screens/auth/login.dart';

class Routes {
  static const login = '/login';
  static const profile = '/profile';

  static PageTransition? onGenerateRoute(route) {
    switch (route.name) {
      case login:
        return PageTransition(child: const Login(), type: PageTransitionType.fade);
      case profile:
        return PageTransition(child: const ProfileScreen(), type: PageTransitionType.fade);
      default:
        return null;
    }
  }
}
