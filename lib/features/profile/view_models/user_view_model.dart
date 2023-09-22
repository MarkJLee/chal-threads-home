import 'dart:async';

import 'package:chal_threads_home/features/authentication/repos/authentication_repo.dart';
import 'package:chal_threads_home/features/profile/models/user_model.dart';
import 'package:chal_threads_home/features/profile/repos/user_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserViewModel extends AsyncNotifier<UserModel> {
  late final UserRepository _userRepo;
  late final AuthenticationRepository _authRepo;
  @override
  FutureOr<UserModel> build() {
    _userRepo = ref.read(userRepositoryProvider);
    _authRepo = ref.read(authRepo);
    return UserModel(
      uid: _authRepo.user?.uid ?? "",
      email: _authRepo.user?.email ?? "",
      account: _authRepo.user?.email?.split('@').first ?? "",
    );
  }

  Future<void> saveUserProfile(UserModel user) async {
    await _userRepo.saveUserProfile(user);
  }
}
