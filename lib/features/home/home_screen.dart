import 'package:chal_threads_home/features/home/widgets/post_bottom_widget.dart';
import 'package:chal_threads_home/features/home/widgets/post_data.dart';
import 'package:chal_threads_home/features/home/widgets/post_header_widget.dart';
import 'package:chal_threads_home/features/home/widgets/post_media_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          postsData.length, // Set the item count to the length of postsData
      itemBuilder: (context, index) {
        final post = postsData[index]; // Get the post data at the current index
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
                  userName: post.userName,
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
