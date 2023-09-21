class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? avatar;
  final String? bio;
  final List<String>? myThreads;
  final List<String>? myReplies;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.avatar,
    this.bio,
    this.myReplies,
    this.myThreads,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        name = json['name'],
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
      'name': name,
      'email': email,
      'avatar': avatar,
      'bio': bio,
    };
  }
}
