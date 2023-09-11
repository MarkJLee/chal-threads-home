import 'package:chal_threads_home/features/search/widgets/users_data.dart';
import 'package:chal_threads_home/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatefulWidget {
  static String routeURL = "/search";
  static String routeName = "search";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
    // 검색어를 기반으로 필터링된 사용자 목록
    List filteredUsers = users_data.where((user) {
      return user.account.toLowerCase().startsWith(_searchText.toLowerCase());
    }).toList();

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
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Row(
                    children: [
                      Text(filteredUsers[index].account),
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
                      Text(filteredUsers[index].name),
                      const SizedBox(height: 7),
                      Text(
                        "${_formatNumber(filteredUsers[index].followers)} followers",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  leading: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.width * 0.1,
                    child: ClipOval(
                      child: Image.asset(
                        filteredUsers[index].userIcon,
                        fit: BoxFit.cover,
                      ),
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
                      color: isDarkMode(context) ? Colors.black : Colors.white,
                      onPressed: () {
                        setState(() {
                          filteredUsers[index].follow =
                              !filteredUsers[index].follow;
                        });
                      },
                      child: Text(
                        !filteredUsers[index].follow ? "Follow" : "Following",
                        style: TextStyle(
                          fontSize: 15,
                          color: !filteredUsers[index].follow
                              ? isDarkMode(context)
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
            ),
          ),
        ],
      ),
    );
  }
}
