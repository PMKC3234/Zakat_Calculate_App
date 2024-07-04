

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zekatcalculate/screens/exchange.dart';
import 'package:zekatcalculate/screens/home.dart';
import 'package:zekatcalculate/screens/boarding.dart';
import 'package:zekatcalculate/screens/notifications.dart';
import 'package:zekatcalculate/screens/profile.dart';
import '../dashboard/dashboard.dart';
import '../screens/core/change_language.dart';
import '../screens/settings.dart';
import '../screens/zakat_follow_up.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

// GoRouter configuration
final routes = GoRouter(
  navigatorKey: _rootNavigatorKey,
   initialLocation: '/boarding',
  //errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => DashboardScreen(
        state: state,
        child: child,
      ),
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/home',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/exchange',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ExchangeScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/zakat',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ZakatScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/settings',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SettingsScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/profile',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ProfileScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/Change_LanguageScreen',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: Change_LanguageScreen()),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/notifications',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: NotificationScreen()),
        ),
      ]
    ),
    GoRoute(
      path: '/boarding',
      builder: (context, state) => const BoardingScreen(),
    ),
  ],
);