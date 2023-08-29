// post_data.dart

import 'package:flutter/material.dart';

class Post {
  final Widget userIcon;
  final String userName;
  final String postText;
  final String postTime;
  final List<Widget> images;
  final int replies;
  final int likes;
  final List<Widget> repImages;

  Post({
    required this.userIcon,
    required this.userName,
    required this.postText,
    required this.postTime,
    required this.images,
    required this.replies,
    required this.likes,
    required this.repImages,
  });
}

List<Post> postsData = [
  Post(
    userIcon: Image.asset("assets/p-4.jpg"),
    userName: 'Podo',
    postText: 'I love taking my dog for a walk.',
    postTime: '26m',
    images: [
      Image.asset("assets/0.jpg"),
      Image.asset("assets/10.jpg"),
    ],
    replies: 15,
    likes: 320,
    repImages: [
      Image.asset("assets/p-0.jpg"),
      Image.asset("assets/p-1.jpg"),
      Image.asset("assets/p-2.jpg")
    ],
  ),
  Post(
    userIcon: Image.asset("assets/p-0.jpg"),
    userName: 'Poddle',
    postText: 'Did you see that adorable puppy? I can see!',
    postTime: '18m',
    images: [],
    replies: 71,
    likes: 452,
    repImages: [
      Image.asset("assets/p-0.jpg"),
      Image.asset("assets/p-1.jpg"),
      Image.asset("assets/p-3.jpg")
    ],
  ),
  Post(
    userIcon: Image.asset("assets/p-0.jpg"),
    userName: 'Poddle',
    postText: 'My dog is the cutest thing ever.',
    postTime: '4m',
    images: [Image.asset("assets/7.jpg"), Image.asset("assets/13.jpg")],
    replies: 85,
    likes: 50,
    repImages: [
      Image.asset("assets/p-0.jpg"),
      Image.asset("assets/p-1.jpg"),
      Image.asset("assets/p-4.jpg")
    ],
  ),
  Post(
    userIcon: Image.asset("assets/p-0.jpg"),
    userName: 'Poddle',
    postText: "Dogs are truly a my best friend.",
    postTime: '48m',
    images: [
      Image.asset("assets/1.jpg"),
      Image.asset("assets/16.jpg"),
      Image.asset("assets/5.jpg")
    ],
    replies: 40,
    likes: 120,
    repImages: [
      Image.asset("assets/p-1.jpg"),
      Image.asset("assets/p-2.jpg"),
      Image.asset("assets/p-3.jpg")
    ],
  ),
  Post(
    userIcon: Image.asset("assets/p-2.jpg"),
    userName: 'Kalmar',
    postText: "Dogs are truly a man's best friend.",
    postTime: '9m',
    images: [Image.asset("assets/6.jpg"), Image.asset("assets/8.jpg")],
    replies: 63,
    likes: 156,
    repImages: [
      Image.asset("assets/p-1.jpg"),
      Image.asset("assets/p-2.jpg"),
      Image.asset("assets/p-4.jpg")
    ],
  ),
  Post(
    userIcon: Image.asset("assets/p-1.jpg"),
    userName: 'RiRi',
    postText: "Where are these dogs looking at?",
    postTime: '34m',
    images: [Image.asset("assets/3.jpg")],
    replies: 5,
    likes: 66,
    repImages: [
      Image.asset("assets/p-2.jpg"),
      Image.asset("assets/p-3.jpg"),
      Image.asset("assets/p-4.jpg")
    ],
  ),
  Post(
    userIcon: Image.asset("assets/p-4.jpg"),
    userName: 'Podo',
    postText: 'Puppies have the most innocent eyes.',
    postTime: '17m',
    images: [Image.asset("assets/20.jpg")],
    replies: 100,
    likes: 160,
    repImages: [
      Image.asset("assets/p-3.jpg"),
      Image.asset("assets/p-4.jpg"),
      Image.asset("assets/p-0.jpg")
    ],
  ),
  Post(
    userIcon: Image.asset("assets/p-1.jpg"),
    userName: 'RiRi',
    postText: "My dog's wagging tail always cheers me up.",
    postTime: '2m',
    images: [Image.asset("assets/17.jpg")],
    replies: 72,
    likes: 500,
    repImages: [
      Image.asset("assets/p-3.jpg"),
      Image.asset("assets/p-4.jpg"),
      Image.asset("assets/p-1.jpg")
    ],
  ),
  Post(
    userIcon: Image.asset("assets/p-4.jpg"),
    userName: 'Podo',
    postText: 'Every dog has its day.',
    postTime: '46m',
    images: [Image.asset("assets/15.jpg")],
    replies: 21,
    likes: 38,
    repImages: [
      Image.asset("assets/p-3.jpg"),
      Image.asset("assets/p-4.jpg"),
      Image.asset("assets/p-2.jpg")
    ],
  ),
  Post(
    userIcon: Image.asset("assets/p-2.jpg"),
    userName: 'Kalmar',
    postText: 'My dog is the cutest thing ever.',
    postTime: '52m',
    images: [Image.asset("assets/2.jpg")],
    replies: 71,
    likes: 393,
    repImages: [
      Image.asset("assets/p-4.jpg"),
      Image.asset("assets/p-3.jpg"),
      Image.asset("assets/p-2.jpg")
    ],
  )
];
