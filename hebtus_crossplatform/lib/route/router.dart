import 'package:go_router/go_router.dart';
import 'package:hebtus_crossplatform/models/creator_events.dart';
import 'package:hebtus_crossplatform/screens/Creator/BasicInfo/basic_info_start.dart';
import 'package:hebtus_crossplatform/screens/all_screens.dart';

import '../globals/globals.dart';

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
        return const ForgotPasswdScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const LandingPageScreen();
      },
    ),
    GoRoute(
      path: '/events/:id',
      builder: (context, state) {
        return EventsScreen(eventID: state.params["id"]!);
      },
    ),
    GoRoute(
      path: '/seemore',
      builder: (context, state) {
        return const SeeMore();
      },
    ),
    GoRoute(
      name: "basicinfo",
      path: "/basicinfo",
      builder: (context, state) {
        CreatorEvent sample =
            state.extra as CreatorEvent; // -> casting is important
        return BasicInfo(eventdetails: sample);
      },
    ),

    GoRoute(
      name: "basicinfoStart",
      path: "/basicinfoStart",
      builder: (context, state) {
        return BasicInfoStart();
      },
    ),
    // GoRoute(
    //   path: '/tickets',
    //   builder: (context, state) {
    //     return const Tickets();
    //   },
    // ),
    // GoRoute(
    //   path: '/publish',
    //   builder: (context, state) {
    //     return const Publish();
    //   },
    // ),

    GoRoute(
      name: "tickets",
      path: "/tickets",
      builder: (context, state) {
        CreatorEvent sample =
            state.extra as CreatorEvent; // -> casting is important
        return Tickets(eventdetails: sample);
      },
    ),
    GoRoute(
      name: "publish",
      path: "/publish",
      builder: (context, state) {
        CreatorEvent sample =
            state.extra as CreatorEvent; // -> casting is important
        return Publish(eventdetails: sample);
      },
    ),


    GoRoute(
      name: "dashboard",
      path: "/dashboard",
      builder: (context, state) {
        CreatorEvent sample =
        state.extra as CreatorEvent; // -> casting is important
        return Dashboard(eventdetails: sample);
      },
    ),
    GoRoute(
      path: '/creatorhome',
      builder: (context, state) {
        return const CreatorEventsScreen();
      },
    ),
  ]);
}
