import 'dart:async';
import 'dart:io';

import 'package:chal_threads_home/features/authentication/repos/authentication_repo.dart';
import 'package:chal_threads_home/features/write/models/post_model.dart';
import 'package:chal_threads_home/features/write/repos/post_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class PostViewModel extends AsyncNotifier<List<PostModel>> {
  late final PostsRepository _postsRepository;
  late final AuthenticationRepository _authRepo;
  List<PostModel> _list = [];

  @override
  FutureOr<List<PostModel>> build() async {
    _postsRepository = ref.read(postsRepositoryProvider);
    _authRepo = ref.read(authRepo);
    final posts = await _postsRepository.loadPosts();
    state = AsyncValue.data(posts);
    return posts;
  }

  FutureOr<List<PostModel>> fetchPosts() async {
    _list = await _postsRepository.loadPosts();
    return _list;
  }

  Future<void> addNewPost(String postText, XFile? imageXFile) async {
    String? uid = _authRepo.user?.uid;
    if (uid == null) {
      return;
    }

    List<String>? imageList;

    if (imageXFile != null) {
      File imageFile = File(imageXFile.path);
      String imageUrl = await _postsRepository.uploadImage(imageFile, uid);
      imageList = [imageUrl];
    }
    final newPost = PostModel(
      postId: "",
      follow: false,
      userIcon: "",
      uid: "",
      postText: postText,
      postTime: DateTime.now(),
      images: imageList,
      numReplies: 0,
      likes: 0,
    );

    await _postsRepository.savePost(newPost);
    fetchPosts();
  }
}

final postViewModelProvider =
    AsyncNotifierProvider<PostViewModel, List<PostModel>>(
  () => PostViewModel(),
);
