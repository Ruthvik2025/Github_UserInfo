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
}
