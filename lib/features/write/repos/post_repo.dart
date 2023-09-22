import 'dart:io';

import 'package:chal_threads_home/features/authentication/repos/authentication_repo.dart';
import 'package:chal_threads_home/features/write/models/post_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';

class PostsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final AuthenticationRepository _authRepo;

  PostsRepository(this._authRepo);

  String getFileExtension(File file) {
    return extension(file.path).toLowerCase();
  }

  String? get uid => _authRepo.user?.uid;

  Future<void> savePost(PostModel post) async {
    var userPostsRef = _db.collection("posts").doc(uid).collection("userPosts");
    var userPostDoc = userPostsRef.doc();

    // Save post to Firestore
    await userPostDoc.set(post.toJson());
  }

  Future<PostModel?> getRecentPost() async {
    if (uid == null) return null;

    var userPostsRef = _db.collection("posts").doc(uid).collection("userPosts");

    // 최근 업로드 포스트
    QuerySnapshot snapshot =
        await userPostsRef.orderBy("postTime", descending: true).limit(1).get();

    if (snapshot.docs.isNotEmpty) {
      return PostModel.fromJson(
          snapshot.docs.first.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<List<PostModel>> loadPosts() async {
    QuerySnapshot snapshot = await _db.collection("posts").get();
    return snapshot.docs
        .map((doc) => PostModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<String> uploadImage(File file, String uid) async {
    var fileExtension = getFileExtension(file);
    var timestamp = DateTime.now().millisecondsSinceEpoch;
    var storageRef =
        _storage.ref().child("posts_images/$uid/$timestamp$fileExtension");
    await storageRef.putFile(file);
    return await storageRef.getDownloadURL();
  }
}

final postsRepositoryProvider =
    Provider<PostsRepository>((ref) => PostsRepository(ref.read(authRepo)));
