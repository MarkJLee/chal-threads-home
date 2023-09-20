import 'package:chal_threads_home/features/activity/activity_screen.dart';
import 'package:chal_threads_home/features/authentication/repos/authentication_repo.dart';
import 'package:chal_threads_home/features/authentication/views/create_account_screen.dart';
import 'package:chal_threads_home/features/authentication/views/login_screen.dart';
import 'package:chal_threads_home/features/home/home_screen.dart';
import 'package:chal_threads_home/features/profile/views/privacy_screen.dart';
import 'package:chal_threads_home/features/profile/views/profile_screen.dart';
import 'package:chal_threads_home/features/profile/views/settings_screen.dart';
import 'package:chal_threads_home/features/search/search_screen.dart';
import 'package:chal_threads_home/navigation_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    // initialLocation: HomeScreen.routeURL,
    initialLocation: HomeScreen.routeURL,
    redirect: (context, state) {
      final isLoggedIn = ref.read(authRepo).isLoggedIn;
      if (!isLoggedIn) {
        if (state.matchedLocation != CreateAccountScreen.routeURL &&
            state.matchedLocation != LoginScreen.routeURL) {
          return LoginScreen.routeURL;
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        name: CreateAccountScreen.routeName,
        path: CreateAccountScreen.routeURL,
        builder: (context, state) => const CreateAccountScreen(),
      ),
      GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routeURL,
        builder: (context, state) => const LoginScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return NavigationShell(child: child);
        },
        routes: [
          GoRoute(
            path: HomeScreen.routeURL,
            name: HomeScreen.routeName,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: SearchScreen.routeURL,
            name: SearchScreen.routeName,
            builder: (context, state) => const SearchScreen(),
          ),
          GoRoute(
            path: ActivityScreen.routeURL,
            name: ActivityScreen.routeName,
            builder: (context, state) => const ActivityScreen(),
          ),
          GoRoute(
            path: ProfileScreen.routeURL,
            name: ProfileScreen.routeName,
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
              path: SettingsScreen.routeURL,
              name: SettingsScreen.routeName,
              builder: (context, state) => const SettingsScreen(),
              routes: [
                GoRoute(
                  path: PrivacyScreen.routeURL,
                  name: PrivacyScreen.routeName,
                  builder: (context, state) => const PrivacyScreen(),
                ),
              ]),
        ],
      ),
    ],
  );
});
