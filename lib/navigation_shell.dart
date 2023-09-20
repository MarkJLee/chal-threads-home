import 'package:chal_threads_home/features/activity/activity_screen.dart';
import 'package:chal_threads_home/features/home/home_screen.dart';
import 'package:chal_threads_home/features/profile/view_models/dark_mode_mv.dart';
import 'package:chal_threads_home/features/profile/views/privacy_screen.dart';
import 'package:chal_threads_home/features/profile/views/profile_screen.dart';
import 'package:chal_threads_home/features/profile/views/settings_screen.dart';
import 'package:chal_threads_home/features/search/search_screen.dart';
import 'package:chal_threads_home/features/widgets/modal_helper.dart';
import 'package:chal_threads_home/features/widgets/threads_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NavigationShell extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Widget child;

  NavigationShell({Key? key, required this.child}) : super(key: key);

  int _getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    print("location: $location");

    if (location == HomeScreen.routeURL) return 0;
    if (location == SearchScreen.routeURL) return 1;
    if (location == ActivityScreen.routeURL) return 3;
    if (location == ProfileScreen.routeURL) return 4;

    if (location.startsWith(ProfileScreen.routeURL)) return 4;
    if (location.startsWith(SettingsScreen.routeURL)) return 4;

    return 0; // 기본값으로 홈 스크린 인덱스 반환
  }

  Widget _selectTitleWidget(int index, BuildContext context, bool isDarkMode) {
    switch (index) {
      case 0:
        return ColorFiltered(
            colorFilter: ColorFilter.mode(
              isDarkMode ? Colors.white : Colors.black,
              BlendMode.srcIn,
            ),
            child: SvgPicture.asset(
              'assets/threads.svg',
              height: 40,
            ));
      case 1:
        return const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Search",
            style: TextStyle(
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
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        );

      default:
        return Container(
          height: 0,
        );
    }
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/');
        break;
      case 1:
        GoRouter.of(context).go('/search');
        break;
      case 2:
        showWriteModal(context);
        break;
      case 3:
        GoRouter.of(context).go('/activity');
        break;
      case 4:
        GoRouter.of(context).go('/profile');
        break;
    }
  }

  PreferredSizeWidget? _selectedAppBar(
      index, context, bool isDarkMode, WidgetRef ref) {
    final String location = GoRouterState.of(context).uri.toString();
    final bool isSettings = location.endsWith(SettingsScreen.routeURL);
    final bool isPrivacy = location.endsWith(PrivacyScreen.routeURL);

    if (index != 4) {
      return AppBar(
        toolbarHeight: null,
        elevation: 0,
        title: _selectTitleWidget(index, context, isDarkMode),
      );
    } else if (isSettings || isPrivacy) {
      return AppBar(
        elevation: 0.2,
        title: Text(
          isSettings ? "Settings" : "Privacy",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
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
                ),
                onPressed: () {
                  isSettings
                      // ? context.goNamed(ProfileScreen.routeName)
                      ? GoRouter.of(context).go('/profile')
                      : GoRouter.of(context).pop();
                },
              ),
              GestureDetector(
                onTap: () {
                  isSettings
                      ? GoRouter.of(context).goNamed(ProfileScreen.routeName)
                      : GoRouter.of(context).pop();
                },
                child: Text(
                  "Back",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider).isDarkMode;
    final index = _getCurrentIndex(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: _selectedAppBar(index, context, isDarkMode, ref),
      body: child,
      bottomNavigationBar: ThreadsBottomNavigationBar(
        currentIndex: index,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
