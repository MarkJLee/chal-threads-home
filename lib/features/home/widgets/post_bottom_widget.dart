import 'package:flutter/material.dart';

class PostBottomWidget extends StatelessWidget {
  final int replies;
  final int likes;
  final List<String>? repImages;

  const PostBottomWidget({
    required this.replies,
    required this.likes,
    this.repImages,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          if (repImages != null && repImages!.isNotEmpty)
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.09,
              height: MediaQuery.of(context).size.width * 0.09,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 10,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                      child: ClipOval(
                        child: Image.asset(repImages![0]),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                      child: ClipOval(child: Image.asset(repImages![1])),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                      child: ClipOval(child: Image.asset(repImages![2])),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "$replies replies · $likes likes",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
