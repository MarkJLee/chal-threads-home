import 'package:chal_threads_home/features/activity/activity_screen.dart';
import 'package:chal_threads_home/features/home/home_screen.dart';
import 'package:chal_threads_home/features/profile/profile_screen.dart';
import 'package:chal_threads_home/features/search/search_screen.dart';
import 'package:chal_threads_home/features/widgets/modal_helper.dart';
import 'package:chal_threads_home/features/widgets/threads_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InitialScreen extends StatefulWidget {
  final int initialIndex;

  const InitialScreen({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    const SearchScreen(),
    HomeScreen(),
    const ActivityScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index == 2) {
        showWriteModal(context);
        return;
      }
      _selectedIndex = index;
    });
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
        return Container();

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight:
            _selectedIndex == 4 ? 0 : null, // hide when profile screen
        backgroundColor: Colors.white,
        elevation: 0,
        title: _selectTitleWidget(_selectedIndex),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: ThreadsBottomNavigationBar(
          selectedIndex: _selectedIndex, onTap: _onItemTapped),
    );
  }
}
