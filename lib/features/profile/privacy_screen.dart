import 'package:chal_threads_home/features/widgets/modal_helper.dart';
import 'package:chal_threads_home/features/widgets/threads_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool _isPrivateProfileSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: const Text(
          "Privacy",
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
                Icons.lock_outline,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                'Private profile',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: CupertinoSwitch(
                value: _isPrivateProfileSwitched,
                onChanged: (value) {
                  setState(() {
                    _isPrivateProfileSwitched = value;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  _isPrivateProfileSwitched = !_isPrivateProfileSwitched;
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.alternate_email,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                'Mentions',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Everyone",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      )),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey.shade600,
                  )
                ]),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.notifications_off_outlined,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                'Muted',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey.shade600,
                  )
                ]),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.visibility_off_outlined,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                'Hidden Words',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey.shade600,
                  )
                ]),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.people_outline,
                color: Colors.black,
                size: 30,
              ),
              title: const Text(
                'Profiles you follow',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey.shade600,
                  )
                ]),
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            const ListTile(
              title: Text(
                "Other privacy settings",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Some settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              trailing: Icon(Icons.launch, color: Colors.grey),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.circleXmark,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'Blocked profiles',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: Icon(Icons.launch, color: Colors.grey),
            ),
            const ListTile(
              leading: FaIcon(
                FontAwesomeIcons.heartCircleXmark,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'Hide likes',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: Icon(Icons.launch, color: Colors.grey),
            )
          ],
        ),
      ),
      bottomNavigationBar: ThreadsBottomNavigationBar(
          selectedIndex: 4,
          onTap: (index) => navigateBasedOnIndex(context, index)),
    );
  }
}
