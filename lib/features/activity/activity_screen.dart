import 'package:chal_threads_home/features/activity/widgets/activity_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ActivityScreen extends StatefulWidget {
  static const routeURL = "/activity";
  static const routeName = "activity";

  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

final List<Map<String, String>> _activityCategories = [
  {"name": "All", "value": "all"},
  {"name": "Follows", "value": "follow"},
  {"name": "Replies", "value": "reply"},
  {"name": "Mentions", "value": "mention"},
  {"name": "Quotes", "value": "quote"},
  {"name": "Reports", "value": "report"},
  {"name": "Verified", "value": "verified"}
];
int _currentIndex = 0;

class _ActivityScreenState extends State<ActivityScreen> {
  Widget _activitySubtitle(int index, List filteredData) {
    if (filteredData[index].category == "follow") {
      return const Text(
        "Followed you",
        style: TextStyle(
          fontSize: 17,
          color: Colors.grey,
        ),
      );
    } else if (filteredData[index].category == "reply") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            filteredData[index].myPostMessage,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.grey,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            filteredData[index].message,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ],
      );
    } else if (filteredData[index].category == "mention") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Mentioned you",
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey,
            ),
          ),
          Text(
            filteredData[index].message,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      );
    } else if (filteredData[index].category == "quote") {
      return Text(
        "Quoted by ${filteredData[index].account}",
        style: const TextStyle(
          fontSize: 17,
          color: Colors.grey,
        ),
      );
    } else if (filteredData[index].category == "report") {
      return Text(
        "Reported by ${filteredData[index].account}",
        style: const TextStyle(
          fontSize: 17,
          color: Colors.grey,
        ),
      );
    } else if (filteredData[index].category == "verified") {
      return Text(
        "Verified by ${filteredData[index].account}",
        style: const TextStyle(
          fontSize: 17,
          color: Colors.grey,
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _activitySubicon(int index, List filteredData) {
    if (filteredData[index].category == "follow") {
      return FaIcon(FontAwesomeIcons.solidCircleUser,
          size: 14, color: Colors.blue.shade800);
    } else if (filteredData[index].category == "reply") {
      return ClipOval(
        child: Container(
          alignment: Alignment.center,
          width: 14,
          height: 14,
          color: Colors.blue.shade400,
          child: const FaIcon(FontAwesomeIcons.reply,
              size: 10, color: Colors.white),
        ),
      );
    } else if (filteredData[index].category == "mention") {
      return ClipOval(
        child: Container(
          width: 14,
          height: 14,
          color: Colors.green.shade400,
          child: SvgPicture.asset(
            'assets/threads.svg',
            height: 12,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      );
    } else if (filteredData[index].category == "quote") {
      return const Text(
        "",
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      );
    } else if (filteredData[index].category == "report") {
      return const Text(
        "",
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      );
    } else if (filteredData[index].category == "verified") {
      return const Text(
        "",
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    // 현재 선택된 카테고리를 기반으로 데이터를 필터링
    List filteredActivities =
        _activityCategories[_currentIndex]["value"] == "all"
            ? activity_data
            : activity_data.where((activity) {
                return activity.category ==
                    _activityCategories[_currentIndex]["value"];
              }).toList();

    return DefaultTabController(
      length: _activityCategories.length, // Number of tabs
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          border: null,
          backgroundColor: Colors.white,
          middle: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _activityCategories.length,
                (index) => Tab(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5),
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.27,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                      color:
                          _currentIndex == index ? Colors.black : Colors.white,
                    ),
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        _activityCategories[index]["name"]!,
                        style: TextStyle(
                            color: _currentIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: ListView.builder(
            itemCount: filteredActivities.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Row(
                  children: [
                    Text(
                      filteredActivities[index].account,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      filteredActivities[index].postTime,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                subtitle: _activitySubtitle(index, filteredActivities),
                isThreeLine: true,
                leading: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      child: ClipOval(
                        child: Image.asset(
                          filteredActivities[index].userIcon,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: _activitySubicon(index, filteredActivities),
                      ),
                    ),
                  ],
                ),
                trailing: filteredActivities[index].category == 'follow'
                    ? Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SizedBox(
                          height: 30,
                          child: CupertinoButton(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 5,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                filteredActivities[index].follow =
                                    !filteredActivities[index].follow;
                              });
                            },
                            child: Text(
                              filteredActivities[index].follow
                                  ? "Following"
                                  : "Follow",
                              style: TextStyle(
                                fontSize: 15,
                                color: filteredActivities[index].follow
                                    ? Colors.grey
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : null,
              );
            },
          ),
        ),
      ),
    );
  }
}
