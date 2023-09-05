import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThreadsBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const ThreadsBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        currentIndex: selectedIndex,
        onTap: (index) {
          if (index != selectedIndex) {
            onTap(index);
          }
        },
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
            icon: selectedIndex == 3
                ? const FaIcon(FontAwesomeIcons.solidHeart)
                : const FaIcon(FontAwesomeIcons.heart),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: selectedIndex == 4
                ? const FaIcon(FontAwesomeIcons.solidUser)
                : const FaIcon(FontAwesomeIcons.user),
          ),
        ],
      ),
    );
  }
}
