import 'dart:async';

import 'package:chal_threads_home/features/profile/models/user_model.dart';
import 'package:chal_threads_home/features/profile/repos/user_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserViewModel extends AsyncNotifier<UserModel> {
  late final UserRepository _userRepo;

  @override
  FutureOr<UserModel> build() {
    _userRepo = ref.read(userRepositoryProvider);

    return UserModel(
      uid: _userRepo.uid ?? "",
      email: _userRepo.email ?? "",
      account: _userRepo.account ?? "",
    );
  }

  Future<void> saveUserProfile(UserModel user) async {
    await _userRepo.saveUserProfile(user);
  }
}
