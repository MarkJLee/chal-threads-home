import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostMediaWidget extends StatelessWidget {
  final Widget image;
  const PostMediaWidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
              width: 30,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: image,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    FaIcon(FontAwesomeIcons.heart),
                    SizedBox(width: 20),
                    FaIcon(FontAwesomeIcons.comment),
                    SizedBox(width: 20),
                    FaIcon(FontAwesomeIcons.retweet),
                    SizedBox(width: 20),
                    FaIcon(FontAwesomeIcons.paperPlane),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
