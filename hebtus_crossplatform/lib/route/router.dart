import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/screens/ResetPassword/reset_passwd_screen.dart';
import 'package:hebtus_crossplatform/screens/all_screens.dart';

class AppRouter {
  final GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) {
        return const SignupScreen();
      },
    ),
    GoRoute(
      path: '/forgotpassword',
      builder: (context, state) {
        return ForgotPasswdScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const LandingPageScreen();
      },
    ),
  ]);
}
