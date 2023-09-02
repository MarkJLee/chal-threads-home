import 'package:chal_threads_home/features/home/home_screen.dart';
import 'package:chal_threads_home/features/search/search_screen.dart';
import 'package:chal_threads_home/features/write/write_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const HomeScreen(),
    const Center(
      child: Text(
        'Index 3: Notifications',
        style: TextStyle(fontSize: 40),
      ),
    ),
    const Center(
      child: Text(
        'Index 4: Profile',
        style: TextStyle(fontSize: 40),
      ),
    ),
  ];

  void _showWriteModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: WriteScreen(),
        );
      },
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      useSafeArea: true,
      enableDrag: true,
    );
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      // Assuming the 3rd item (index 2) should trigger the bottom sheet
      _showWriteModal();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  Widget _selectTitleWidget(int index) {
    switch (index) {
      case 0:
        return SvgPicture.asset('assets/threads.svg', height: 40);
      case 1:
        return const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Search",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      case 3:
        return const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Activity",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      case 4:
        return const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: _selectTitleWidget(_selectedIndex),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          fixedColor: Colors.black,
          unselectedItemColor: Colors.grey,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              label: "",
              icon: FaIcon(FontAwesomeIcons.house),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: FaIcon(FontAwesomeIcons.penToSquare),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: FaIcon(FontAwesomeIcons.heart),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: FaIcon(FontAwesomeIcons.user),
            ),
          ],
        ),
      ),
    );
  }
}
