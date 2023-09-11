import 'package:chal_threads_home/features/home/widgets/post_action_buttons_in_bottom_sheet.dart';
import 'package:chal_threads_home/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostHeaderWidget extends StatelessWidget {
  final String account;
  final String postText;
  final String postTime;
  final String userIcon;
  final bool follow;

  const PostHeaderWidget({
    Key? key,
    required this.account,
    required this.postText,
    required this.postTime,
    required this.userIcon,
    required this.follow,
  }) : super(key: key);

  Future<void> _onEllipsisTapped(BuildContext context) async {
    await showModalBottomSheet(
      showDragHandle: true, // show drag bar at the top
      context: context,
      builder: (context) => PostActionButtonsInBottomSheetWidget(
        follow: follow,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      // backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.11,
                height: MediaQuery.of(context).size.width * 0.11,
                child:
                    ClipOval(child: Image.asset(userIcon, fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: isDarkMode(context) ? Colors.black : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color:
                            isDarkMode(context) ? Colors.black : Colors.white,
                        width: 2),
                  ),
                  child: follow
                      ? Container() // follow
                      : const FaIcon(FontAwesomeIcons.circlePlus, size: 20),
                ),
              ),
            ],
          ),
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
                        account,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(width: 5),
                      if (account != "Mark_J") // for ProfileScreen
                        const Stack(
                          alignment: Alignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.certificate,
                              size: 13,
                              color: Colors.blue,
                            ),
                            FaIcon(
                              FontAwesomeIcons.check,
                              size: 8,
                              color: Colors.white,
                            ),
                          ],
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        postTime,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => _onEllipsisTapped(context),
                        child: const FaIcon(
                          FontAwesomeIcons.ellipsis,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                postText,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
