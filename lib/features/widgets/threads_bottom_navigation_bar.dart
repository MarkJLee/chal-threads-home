import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThreadsBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function onItemTapped;

  const ThreadsBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (int idx) => onItemTapped(idx, context),
        items: [
          const BottomNavigationBarItem(
            label: "",
            icon: FaIcon(FontAwesomeIcons.house),
          ),
          const BottomNavigationBarItem(
            label: "",
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
          ),
          const BottomNavigationBarItem(
            label: "",
            icon: FaIcon(FontAwesomeIcons.penToSquare),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: currentIndex == 3
                ? const FaIcon(FontAwesomeIcons.solidHeart)
                : const FaIcon(FontAwesomeIcons.heart),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: currentIndex == 4
                ? const FaIcon(FontAwesomeIcons.solidUser)
                : const FaIcon(FontAwesomeIcons.user),
          ),
        ],
      ),
    );
  }
}
