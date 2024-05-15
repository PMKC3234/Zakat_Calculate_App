

import 'package:go_router/go_router.dart';
import 'package:zekatcalculate/screens/exchange.dart';
import 'package:zekatcalculate/screens/home.dart';
import 'package:zekatcalculate/screens/boarding.dart';
import 'package:zekatcalculate/screens/notifications.dart';
import 'package:zekatcalculate/screens/profile.dart';
import '../screens/core/change_language.dart';
import '../screens/settings.dart';
import '../screens/zakat_follow_up.dart';



// GoRouter configuration
final routes = GoRouter(
   initialLocation: '/boarding',
  //errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/boarding',
      builder: (context, state) => const BoardingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/exchange',
      builder: (context, state) => const ExchangeScreen(),
    ),
     GoRoute(
      path: '/zakat',
      builder: (context, state) => const ZakatScreen(),
    ),
     GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => NotificationScreen(),
    ),
     GoRoute(
      path: '/Change_LanguageScreen',
      builder: (context, state) => const Change_LanguageScreen(),
    ),
   
  ],
);