class User {
  String? username;
  String? imageUrl;
  int? followers;
  int? following;
  int? public_repo;
  String? joined_date;

  User({
    required this.followers,
    required this.following,
    required this.imageUrl,
    required this.joined_date,
    required this.public_repo,
    required this.username,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['login'],
      followers: json['followers'],
      following: json['following'],
      imageUrl: json['avatar_url'],
      joined_date: json['created_at'],
      public_repo: json['public_repos'],

      // Map other fields from the JSON data
    );
  }
}
