import 'package:chal_threads_home/features/home/models/post_data.dart';
import 'package:chal_threads_home/features/home/widgets/post_header_widget.dart';
import 'package:chal_threads_home/features/home/widgets/post_media_widget.dart';
import 'package:chal_threads_home/features/profile/view_models/dark_mode_mv.dart';
import 'package:chal_threads_home/features/profile/views/settings_screen.dart';
import 'package:chal_threads_home/features/widgets/modal_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static const routeURL = "/profile";
  static const routeName = "profile";

  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final tabs = ["Threads", "Replies"];

  int _selectedTabIndex = 0;

  late TabController _tabController;

  final GlobalKey _textFieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      _selectedTabIndex = _tabController.index;
    });
  }

  double _getTextFieldHeight() {
    final RenderBox? renderBox =
        _textFieldKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size.height ?? 50; // VerticalDivider 디폴트 높이는 50
  }

  void _navigateToSettingsScreen(BuildContext context) {
    context.goNamed(SettingsScreen.routeName);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  final threadsFilteredPosts =
      postsData.where((post) => post.account == "Mark_J").toList();

  final repliesFilteredPosts =
      postsData.where((post) => post.myReply?.isNotEmpty ?? false).toList();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(darkModeProvider).isDarkMode;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white : Colors.black,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                        color: isDarkMode ? Colors.white : Colors.black,
                        width: 2),
                  ),
                  alignment: Alignment.center,
                  child: FaIcon(
                    FontAwesomeIcons.globe,
                    color: isDarkMode ? Colors.black : Colors.white,
                    size: 22,
                  ),
                ),
                Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 28,
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () => _navigateToSettingsScreen(context),
                      child: const FaIcon(
                        FontAwesomeIcons.bars,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Mark",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Mark_J",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  alignment: Alignment.center,
                                  height: 25,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Text(
                                    "threads.net",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.15,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/p-mark.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Doggy enthusiast!",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                          height: MediaQuery.of(context).size.width * 0.1,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 10,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                  child: ClipOval(
                                      child: Image.asset("assets/p-4.jpg")),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 10,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                  child: ClipOval(
                                      child: Image.asset("assets/p-2.jpg")),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "2 followers",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade400,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CupertinoButton(
                            minSize: 0, // 기본 44로 설정되어 있음
                            padding: EdgeInsets.zero,
                            onPressed: () => showEditProfileModal(context),
                            child: Text(
                              "Edit profile",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade400,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CupertinoButton(
                            minSize: 0, // 기본 44로 설정되어 있음
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Text(
                              "Share profile",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverHeaderDelegate(
              child: Material(
                // color: Colors.white, // TabBar background color
                color: isDarkMode ? Colors.black : Colors.white,
                child: Center(
                  child: TabBar(
                    controller: _tabController,
                    splashFactory: NoSplash.splashFactory,
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15,
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: true,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    indicatorColor: isDarkMode ? Colors.white : Colors.black,
                    unselectedLabelColor: Colors.grey.shade500,
                    tabs: [
                      for (var tab in tabs)
                        Tab(
                          text: tab,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_selectedTabIndex == 0)
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                final post = threadsFilteredPosts[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      children: [
                        PostHeaderWidget(
                          postText: post.postText,
                          postTime: post.postTime,
                          userIcon: post.userIcon,
                          account: post.account,
                          follow: post.follow,
                        ),
                        const SizedBox(height: 8),
                        PostMediaWidget(
                          images: post.images,
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                );
              }, childCount: threadsFilteredPosts.length),
            ),
          if (_selectedTabIndex == 1)
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                final post = repliesFilteredPosts[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    height:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: ClipOval(
                                      child: Image.asset(post.userIcon,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: _getTextFieldHeight(),
                                    child: const VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                    height: MediaQuery.of(context).size.width *
                                        0.05,
                                    child: ClipOval(
                                      child: Opacity(
                                        opacity: 0.5,
                                        child: Image.asset(
                                          post.userIcon,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        key: _textFieldKey,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                post.account,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    post.postTime,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
                                                  const FaIcon(
                                                    FontAwesomeIcons.ellipsis,
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 10),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            child: Text(
                                              post.postText,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey.shade400,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.05,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.05,
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                            post.rePost
                                                                    ?.userIcon ??
                                                                "assets/p-mark.jpg",
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text(
                                                      post.rePost?.account ??
                                                          "",
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      post.rePost?.postText ??
                                                          "",
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      "${post.rePost?.numReplies} replies",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 16),
                                            child: Row(
                                              children: [
                                                FaIcon(FontAwesomeIcons.heart),
                                                SizedBox(width: 20),
                                                FaIcon(
                                                    FontAwesomeIcons.comment),
                                                SizedBox(width: 20),
                                                FaIcon(
                                                    FontAwesomeIcons.retweet),
                                                SizedBox(width: 20),
                                                FaIcon(FontAwesomeIcons
                                                    .paperPlane),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Mark_J",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    post.postTime,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
                                                  const FaIcon(
                                                    FontAwesomeIcons.ellipsis,
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 10),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            child: Text(
                                              post.myReply ?? "",
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 16),
                                            child: Row(
                                              children: [
                                                FaIcon(FontAwesomeIcons.heart),
                                                SizedBox(width: 20),
                                                FaIcon(
                                                    FontAwesomeIcons.comment),
                                                SizedBox(width: 20),
                                                FaIcon(
                                                    FontAwesomeIcons.retweet),
                                                SizedBox(width: 20),
                                                FaIcon(FontAwesomeIcons
                                                    .paperPlane),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                );
              }, childCount: repliesFilteredPosts.length),
            ),
        ],
      ),
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 40.0; // 필요한 최대 높이 설정

  @override
  double get minExtent => 40.0; // 필요한 최소 높이 설정

  @override
  bool shouldRebuild(_SliverHeaderDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
