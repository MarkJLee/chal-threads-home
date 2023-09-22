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
  final List<PostModel> _list = [];

  @override
  FutureOr<List<PostModel>> build() async {
    _postsRepository = ref.read(postsRepositoryProvider);
    _authRepo = ref.read(authRepo);
    final posts = await _postsRepository.loadPosts();
    state = AsyncValue.data(posts);
    return posts;
  }

  Future<PostModel?> fetchRecentPost() async {
    return await _postsRepository.getRecentPost();
  }

  Future<void> addNewPost(String postText, XFile? imageXFile) async {
    String? uid = _authRepo.user?.uid;
    String? email = _authRepo.user?.email;

    if (uid == null || email == null) {
      return;
    }

    List<String>? imageList;

    if (imageXFile != null) {
      File imageFile = File(imageXFile.path);
      String imageUrl = await _postsRepository.uploadImage(imageFile, uid);
      imageList = [imageUrl];
    }

    // account(username)은 임시로 email 앞부분을 사용
    final account = email.split('@').first;

    final newPost = PostModel(
      account: account, // 임시
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

    // 새로 저장된 게시물 가져오기
    PostModel? recentPost = await fetchRecentPost();
    if (recentPost != null) {
      // 새로 추가된 게시물을 목록의 시작 부분에 추가
      _list.insert(0, recentPost);
      // 상태 업데이트
      state = AsyncValue.data([..._list]);
    }
  }
}

final postViewModelProvider =
    AsyncNotifierProvider<PostViewModel, List<PostModel>>(
  () => PostViewModel(),
);
