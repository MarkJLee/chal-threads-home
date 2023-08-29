import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostHeaderWidget extends StatelessWidget {
  final String userName;
  final String postText;
  final String postTime;
  final Widget userIcon;

  const PostHeaderWidget({
    Key? key,
    required this.userName,
    required this.postText,
    required this.postTime,
    required this.userIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: userIcon,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      const FaIcon(
                        FontAwesomeIcons.circleCheck,
                        size: 12,
                        color: Colors.blue,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        postTime,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 10),
                      const FaIcon(
                        FontAwesomeIcons.ellipsis,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
              Text(postText),
            ],
          ),
        ),
      ],
    );
  }
}
