import 'package:chal_threads_home/features/home/widgets/post_bottom_widget.dart';
import 'package:chal_threads_home/features/home/widgets/post_data.dart';
import 'package:chal_threads_home/features/home/widgets/post_header_widget.dart';
import 'package:chal_threads_home/features/home/widgets/post_media_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeURL = "/";
  static String routeName = "home";
  HomeScreen({
    Key? key,
  }) : super(key: key);

  final List<Post> filteredData =
      postsData.where((element) => element.account != "Mark_J").toList();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        final post = filteredData[index];
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
                  repImages: post.repImages,
                  replies: post.replies,
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
