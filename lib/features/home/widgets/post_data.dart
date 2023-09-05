// post_data.dart

import 'package:chal_threads_home/features/profile/widgets/repost_data.dart';

class Post {
  final bool follow;
  final String userIcon;
  final String account;
  final String postText;
  final String postTime;
  final List<String> images;
  final int replies;
  final int likes;
  final List<String> repImages;
  final RePost? rePost;
  final String? myReply; // for my Replies in ProfileScreen

  Post({
    required this.follow,
    required this.userIcon,
    required this.account,
    required this.postText,
    required this.postTime,
    required this.images,
    required this.replies,
    required this.likes,
    required this.repImages,
    this.rePost,
    this.myReply,
  });
}

List<Post> postsData = [
  Post(
    follow: true,
    userIcon: "assets/p-4.jpg",
    account: 'Podo',
    postText: 'I love taking my dog for a walk.',
    postTime: '26m',
    images: [
      "assets/0.jpg",
      "assets/10.jpg",
    ],
    replies: 15,
    likes: 320,
    repImages: ["assets/p-0.jpg", "assets/p-1.jpg", "assets/p-2.jpg"],
  ),
  Post(
    follow: false,
    userIcon: "assets/p-0.jpg",
    account: 'Poddle',
    postText: 'Did you see that adorable puppy? I can see!',
    postTime: '18m',
    images: [],
    replies: 71,
    likes: 452,
    repImages: ["assets/p-0.jpg", "assets/p-1.jpg", "assets/p-3.jpg"],
  ),
  Post(
    follow: false,
    userIcon: "assets/p-0.jpg",
    account: 'Poddle',
    postText: 'My dog is the cutest thing ever.',
    postTime: '4m',
    images: ["assets/7.jpg", "assets/13.jpg"],
    replies: 85,
    likes: 50,
    repImages: ["assets/p-0.jpg", "assets/p-1.jpg", "assets/p-4.jpg"],
  ),
  Post(
    follow: false,
    userIcon: "assets/p-0.jpg",
    account: 'Poddle',
    postText: "Dogs are truly a my best friend.",
    postTime: '48m',
    images: ["assets/1.jpg", "assets/16.jpg", "assets/5.jpg"],
    replies: 40,
    likes: 120,
    repImages: ["assets/p-1.jpg", "assets/p-2.jpg", "assets/p-3.jpg"],
  ),
  Post(
    follow: true,
    userIcon: "assets/p-2.jpg",
    account: 'Kalmar',
    postText: "Dogs are truly a man's best friend.",
    postTime: '9m',
    images: ["assets/6.jpg", "assets/8.jpg"],
    replies: 63,
    likes: 156,
    repImages: ["assets/p-1.jpg", "assets/p-2.jpg", "assets/p-4.jpg"],
  ),
  Post(
    follow: false,
    userIcon: "assets/p-1.jpg",
    account: 'RiRi',
    postText: "Where are these dogs looking at?",
    postTime: '34m',
    images: ["assets/3.jpg"],
    replies: 5,
    likes: 66,
    repImages: ["assets/p-2.jpg", "assets/p-3.jpg", "assets/p-4.jpg"],
  ),
  Post(
    follow: true,
    userIcon: "assets/p-4.jpg",
    account: 'Podo',
    postText: 'Puppies have the most innocent eyes.',
    postTime: '17m',
    images: ["assets/20.jpg"],
    replies: 100,
    likes: 160,
    repImages: ["assets/p-3.jpg", "assets/p-4.jpg", "assets/p-0.jpg"],
  ),
  Post(
    follow: false,
    userIcon: "assets/p-1.jpg",
    account: 'RiRi',
    postText: "My dog's wagging tail always cheers me up.",
    postTime: '2m',
    images: ["assets/17.jpg"],
    replies: 72,
    likes: 500,
    repImages: ["assets/p-3.jpg", "assets/p-4.jpg", "assets/p-1.jpg"],
  ),
  Post(
    follow: true,
    userIcon: "assets/p-4.jpg",
    account: 'Podo',
    postText: 'Every dog has its day.',
    postTime: '46m',
    images: ["assets/15.jpg"],
    replies: 21,
    likes: 38,
    repImages: ["assets/p-3.jpg", "assets/p-4.jpg", "assets/p-2.jpg"],
  ),
  Post(
    follow: true,
    userIcon: "assets/p-2.jpg",
    account: 'Kalmar',
    postText: 'My dog is the cutest thing ever.',
    postTime: '52m',
    images: ["assets/2.jpg"],
    replies: 71,
    likes: 393,
    repImages: ["assets/p-4.jpg", "assets/p-3.jpg", "assets/p-2.jpg"],
  ),
  Post(
    account: 'Mark_J',
    postText:
        'I truly believe that puppies are the cutest things on this planet!',
    postTime: '1h',
    userIcon: "assets/p-mark.jpg",
    follow: true,
    images: [],
    replies: 1,
    likes: 1,
    repImages: [],
  ),
  Post(
    account: 'Mark_J',
    postText: "This pup is mine, but Kalmar 'dognapped' it for a whole year!",
    postTime: '10h',
    userIcon: "assets/p-mark.jpg",
    follow: true,
    images: ["assets/2.jpg"],
    replies: 1,
    likes: 1,
    repImages: [],
  ),
  Post(
    account: 'Mark_J',
    postText:
        "This adorable puppy is my little cousin! If you're up for some playtime, drop a reply below, and we'll have a lucky draw to give someone the chance to join the fun!",
    postTime: '23h',
    userIcon: "assets/p-mark.jpg",
    follow: true,
    images: ["assets/17.jpg"],
    replies: 1,
    likes: 1,
    repImages: [],
  ),
  Post(
    account: 'Podo',
    postText: "Where on earth did you find this wolf-like pupper?",
    postTime: '7h',
    userIcon: "assets/p-4.jpg",
    follow: true,
    images: [],
    replies: 1,
    likes: 1,
    repImages: [],
    rePost: RePost(
      userIcon: "assets/p-2.jpg",
      account: 'Kalmar',
      postText: "My dog is the cutest thing ever.",
      replies: 1,
    ),
    myReply:
        "This little furball is mine, I tell you! 😭. I found it in the woods, and it was so cute that I couldn't resist taking it home.",
  ),
];
