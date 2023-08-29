import 'package:chal_threads_home/features/home/home_screen.dart';
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

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Center(
      child: Text(
        'Index 1: Search',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Center(
      child: Text(
        'Index 2: Write',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Center(
      child: Text(
        'Index 3: Notifications',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Center(
      child: Text(
        'Index 4: Profile',
        style: TextStyle(fontSize: 40),
      ),
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SvgPicture.asset('assets/threads.svg', height: 40),
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
