import 'package:chal_threads_home/features/home/view_models/home_view_models.dart';
import 'package:chal_threads_home/features/home/widgets/post_bottom_widget.dart';
import 'package:chal_threads_home/features/home/widgets/post_header_widget.dart';
import 'package:chal_threads_home/features/home/widgets/post_media_widget.dart';
import 'package:chal_threads_home/features/write/models/post_model.dart';
import 'package:chal_threads_home/features/write/view_models/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static String routeURL = "/";
  static String routeName = "home";
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(homeViewModelProvider);

    ref.listen<AsyncValue<List<PostModel>>>(postViewModelProvider,
        (previous, current) {
      current.when(
        data: (dataList) {
          if (dataList.isNotEmpty) {
            PostModel postModel = dataList[0];
            ref
                .read(homeViewModelProvider.notifier)
                .handleNewPostModel(postModel);
          }
        },
        loading: () {},
        error: (_, __) {},
      );
    });

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              children: [
                PostHeaderWidget(
                  postText: post.postText,
                  postTime: post.postTime,
                  userIcon: post.userIcon,
                  account: post.account,
                  follow: post.follow,
                ),
                const SizedBox(height: 8),
                PostMediaWidget(
                  images: post.images, // Use the images from the post data
                ),
                PostBottomWidget(
                  repImages: post.replyImages,
                  replies: post.numReplies,
                  likes: post.likes,
                ),
                const Divider()
              ],
            ),
          ),
        );
      },
    );
  }
}
