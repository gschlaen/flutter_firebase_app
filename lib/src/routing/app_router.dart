import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_app/src/routing/go_router_refresh_stream.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../screens/custom_profile_screen.dart';
import '../screens/custom_sign_in_screen.dart';

enum AppRoute {
  signIn,
  profile,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/sign-in',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;

      if (isLoggedIn) {
        if (state.uri.path == '/sign-in') {
          return '/profile';
        }
      } else {
        if (state.uri.path == '/profile') {
          return '/sign-in';
        }
      }
      return null;
    },
    refreshListenable:
        GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()),
    routes: [
      GoRoute(
        path: '/sign-in',
        name: AppRoute.signIn.name,
        builder: (context, state) => const CustomSignInScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: AppRoute.profile.name,
        builder: (context, state) => const CustomProfileScreen(),
      ),
    ],
  );
});
