import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostBottomWidget extends StatelessWidget {
  final int replies;
  final int likes;

  const PostBottomWidget({
    required this.replies,
    required this.likes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          const FaIcon(
            FontAwesomeIcons.earthAmericas,
            size: 30,
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
