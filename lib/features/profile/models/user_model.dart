class UserModel {
  final String uid;
  final String account;
  final String email;
  final String? avatar;
  final String? bio;
  final List<String>? myThreads;
  final List<String>? myReplies;

  UserModel({
    required this.uid,
    required this.account,
    required this.email,
    this.avatar,
    this.bio,
    this.myReplies,
    this.myThreads,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        account = json['account'],
        email = json['email'],
        avatar = json['avatar'] ?? '',
        bio = json['bio'] ?? '',
        myThreads = (json['myThreads'] as List?)
            ?.map((item) => item as String)
            .toList(),
        myReplies = (json['myReplies'] as List?)
            ?.map((item) => item as String)
            .toList();

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'account': account,
      'email': email,
      'avatar': avatar,
      'bio': bio,
    };
  }
}
