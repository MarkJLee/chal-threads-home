import 'package:cloud_firestore/cloud_firestore.dart';

// post와 reply 모두 PostModel
class PostModel {
  final String account;
  final String postId;
  final String? parentPostId;
  final bool follow;
  final String userIcon;
  final String uid;
  final String postText;
  final DateTime postTime;
  final List<String>? images;
  final int numReplies;
  final int likes;
  final List<String>? replyIds;
  final List<String>? replyImages;

  PostModel({
    required this.account,
    required this.postId,
    this.parentPostId,
    required this.follow,
    required this.userIcon,
    required this.uid,
    required this.postText,
    required this.postTime,
    this.images,
    required this.numReplies,
    required this.likes,
    this.replyIds,
    this.replyImages,
  });

  // Firestore 데이터를 PostModel 객체로 변환하는 일반 생성자
  PostModel.fromJson(Map<String, dynamic> json)
      : account = json['account'],
        postId = json['postId'],
        parentPostId = json['parentPostId'],
        follow = json['follow'],
        userIcon = json['userIcon'],
        uid = json['uid'],
        postText = json['postText'],
        postTime = (json['postTime'] as Timestamp).toDate(),
        images =
            (json['images'] as List?)?.map((item) => item as String).toList(),
        numReplies = json['numReplies'],
        likes = json['likes'],
        replyIds =
            (json['replyIds'] as List?)?.map((item) => item as String).toList(),
        replyImages = (json['replyImages'] as List?)
            ?.map((item) => item as String)
            .toList();

  // PostModel 객체를 Firestore에 저장하기 위해 Map 형태로 변환
  Map<String, dynamic> toJson() {
    return {
      'account': account,
      'postId': postId,
      'parentPostId': parentPostId,
      'follow': follow,
      'userIcon': userIcon,
      'uid': uid,
      'postText': postText,
      'postTime': postTime,
      'images': images,
      'numReplies': numReplies,
      'likes': likes,
      'replyIds': replyIds,
      'replyImages': replyImages,
    };
  }
}
