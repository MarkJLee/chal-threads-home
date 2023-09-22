import 'dart:math';

import 'package:chal_threads_home/features/profile/models/user_model.dart';
import 'package:chal_threads_home/features/profile/view_models/dark_mode_mv.dart';
import 'package:chal_threads_home/features/search/view_models/search_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends ConsumerStatefulWidget {
  static String routeURL = "/search";
  static String routeName = "search";
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> {
  String _searchText = "";

  String _formatNumber(int n) {
    if (n >= 1000000) {
      return "${(n / 1000000).toStringAsFixed(1)}M";
    } else if (n >= 1000) {
      return "${(n / 1000).toStringAsFixed(1)}K";
    } else {
      return n.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(darkModeProvider).isDarkMode;
    final searchViewModel = ref.read(searchViewModelProvider);

    // 검색어를 기반으로 필터링된 사용자 목록
    // List filteredUsers = users_data.where((user) {
    //   return user.account.toLowerCase().startsWith(_searchText.toLowerCase());
    // }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          CupertinoSearchTextField(
            placeholder: "Search",
            onChanged: (value) {
              setState(() {
                _searchText = value;
              });
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: _searchText.isNotEmpty
                ? FutureBuilder<List<UserModel>>(
                    future: searchViewModel.searchUsers(_searchText),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No users found.'));
                      } else {
                        final filteredUsers = snapshot.data!;
                        return ListView.builder(
                          itemCount: filteredUsers.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      filteredUsers[index].email,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
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
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    filteredUsers[index].account,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    // "${_formatNumber(filteredUsers[index].followers)} followers",
                                    "${_formatNumber(Random().nextInt(1000000))} followers",
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              isThreeLine: true,
                              leading: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.1,
                                height: MediaQuery.of(context).size.width * 0.1,
                                child: const ClipOval(
                                  // child: Image.asset(filteredUsers[index].userIcon, fit: BoxFit.cover,
                                  child: Icon(Icons.people),
                                ),
                              ),
                              trailing: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: CupertinoButton(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 5,
                                  ),
                                  color:
                                      isDarkMode ? Colors.black : Colors.white,
                                  onPressed: () {
                                    // setState(() {
                                    //   filteredUsers[index].follow =
                                    //       !filteredUsers[index].follow;
                                    // });
                                  },
                                  child: Text(
                                    // !filteredUsers[index].follow ? "Follow" : "Following",
                                    "Follow",
                                    style: TextStyle(
                                      fontSize: 15,
                                      // color: !filteredUsers[index].follow
                                      color: true
                                          ? isDarkMode
                                              ? Colors.white
                                              : Colors.black
                                          : Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  )
                : const Center(child: Text('Please enter a search term.')),
          ),
        ],
      ),
    );
  }
}
