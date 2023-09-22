import 'package:chal_threads_home/features/profile/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<UserModel>> searchUsersInFirestore(String query) async {
    // query의 시작과 끝 문자열을 생성
    // 시작 문자열은 query 그대로, 끝 문자열은 query에 문자열의 가장 높은 유니코드 값을 붙인 것
    String startAt = query;
    String endAt = '$query\uf8ff';

    final QuerySnapshot userSnapshot = await _db
        .collection("users")
        .where("account", isGreaterThanOrEqualTo: startAt)
        .where("account", isLessThan: endAt)
        .get();

    final List<UserModel> users = userSnapshot.docs
        .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return users;
  }
}

final searchRepositoryProvider =
    Provider<SearchRepository>((ref) => SearchRepository());
