import 'package:chal_threads_home/features/authentication/repos/authentication_repo.dart';
import 'package:chal_threads_home/features/profile/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final AuthenticationRepository _authRepo;

  UserRepository(this._authRepo);
  String? get uid => _authRepo.user?.uid;

  Future<void> saveUserProfile(UserModel user) async {
    var userRef = _db.collection("users").doc(uid);
    await userRef.set(user.toJson());
  }
}

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepository(ref.read(authRepo)));
