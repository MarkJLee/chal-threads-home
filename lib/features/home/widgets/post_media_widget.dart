import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostMediaWidget extends StatelessWidget {
  final List<Widget>? images;
  const PostMediaWidget({
    Key? key,
    this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0,
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
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: (images == null || images!.isEmpty)
                      ? Container()
                      : images?.length == 1
                          ? images![0]
                          : SizedBox(
                              height: MediaQuery.of(context).size.height * 0.25,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: images!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: images![index],
                                  );
                                },
                              ),
                            ),
                ),
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
