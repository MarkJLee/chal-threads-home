class Activity {
  final String account;
  final String category; // follow, reply, mention
  final String message;
  final String myPostMessage;
  final String userIcon;
  bool follow;
  final String postTime;

  Activity({
    required this.account,
    required this.category,
    required this.message,
    required this.userIcon,
    required this.follow,
    required this.postTime,
    this.myPostMessage = "",
  });
}

List<Activity> activity_data = [
  Activity(
      account: "Podo",
      category: "mention",
      message:
          "Hey, you're not eating your food! Do you want me to grab something tasty for you? @mark_j ",
      userIcon: "assets/p-4.jpg",
      follow: true,
      postTime: "5h"),
  Activity(
      account: "Podo",
      category: "mention",
      message: "I love taking my dog for a walk. @mark_j",
      userIcon: "assets/p-4.jpg",
      follow: true,
      postTime: "26m",
      myPostMessage: ""),
  Activity(
    account: "Poddle",
    category: "follow",
    message: "Followed you",
    userIcon: "assets/p-0.jpg",
    follow: false,
    postTime: "6h",
  ),
  Activity(
      account: "Kalmar",
      category: "reply",
      message: "My dog's getting chubby too!",
      userIcon: "assets/p-2.jpg",
      follow: true,
      postTime: "1h",
      myPostMessage: "My dog is gradually packing on the pounds!"),
];
