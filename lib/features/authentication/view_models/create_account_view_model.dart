import 'dart:async';

import 'package:chal_threads_home/features/authentication/repos/authentication_repo.dart';
import 'package:chal_threads_home/features/home/views/home_screen.dart';
import 'package:chal_threads_home/features/profile/models/user_model.dart';
import 'package:chal_threads_home/features/profile/repos/user_repo.dart';
import 'package:chal_threads_home/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateAccountViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;
  late final UserRepository _userRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
    _userRepo = ref.read(userRepositoryProvider);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    state = await AsyncValue.guard(() async {
      await _authRepo.signUp(
        form["email"],
        form["password"],
      );
      final String uid = _authRepo.user?.uid ?? "";
      final String email = _authRepo.user?.email ?? "";
      final String account = _authRepo.user?.email?.split('@').first ?? "";
      final UserModel user = UserModel(
        uid: uid,
        email: email,
        account: account,
      );
      await _userRepo.saveUserProfile(user);
    });
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.goNamed(HomeScreen.routeName);
    }
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<CreateAccountViewModel, void>(
  () => CreateAccountViewModel(),
);
