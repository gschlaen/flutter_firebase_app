import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui_auth_providers.dart';

class CustomProfileScreen extends ConsumerWidget {
  const CustomProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authPorvidersProvider);

    return ProfileScreen(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      providers: authProviders,
      // actions: [
      //   SignedOutAction((context) {
      //     context.goNamed(AppRoute.signIn.name);
      //   }),
      // ],
    );
  }
}
