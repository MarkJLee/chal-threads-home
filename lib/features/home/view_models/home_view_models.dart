import 'package:chal_threads_home/features/home/models/post_data.dart';
import 'package:chal_threads_home/features/write/models/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends StateNotifier<List<Post>> {
  HomeViewModel() : super([]) {
    loadInitialPosts();
  }

  // 기존의 Post 데이터 로딩
  void loadInitialPosts() {
    state = postsData.where((element) => element.account != "").toList();
  }

  // PostModel을 Post로 변환
  Post postModelToPost(PostModel postModel) {
    return Post(
      follow: true,
      userIcon: "assets/p-mark.jpg",
      account: postModel.account,
      postText: postModel.postText,
      postTime: "0m",
      images: postModel.images,
      numReplies: 0,
      likes: 0,
    );
  }

  // 새로운 PostModel을 받아서 Post로 변환 후 추가
  void handleNewPostModel(PostModel postModel) async {
    await Future.delayed(Duration.zero);
    Post post = postModelToPost(postModel);
    // 상태에 동일한 포스트가 없을 경우에만 추가, 아니면 무한 삽입 됨
    if (!state.contains(post)) {
      state = [post, ...state];
    }
  }
}

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, List<Post>>((ref) {
  return HomeViewModel();
});
