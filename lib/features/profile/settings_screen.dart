import 'package:chal_threads_home/features/profile/privacy_screen.dart';
import 'package:chal_threads_home/features/widgets/modal_helper.dart';
import 'package:chal_threads_home/features/widgets/threads_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoading = false;

  void _showLogOutDialog(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
    });

    _displayLogOutDialog();
  }

  void _displayLogOutDialog() {
    final context = _scaffoldKey.currentContext;

    if (context != null) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Log out?'),
            content: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  "assets/8.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 100,
        leading: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                "Back",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(
                Icons.person_add_outlined,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                "Follow and invite friends",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.lock_outlined,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                "Privacy",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrivacyScreen(),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                "Account",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.support,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                "Help",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                "About",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {},
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _showLogOutDialog(context),
                    child: const Text(
                      "Log out",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                  _isLoading ? const CupertinoActivityIndicator() : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ThreadsBottomNavigationBar(
          selectedIndex: 4,
          onTap: (index) => navigateBasedOnIndex(context, index)),
    );
  }
}
