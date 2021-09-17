class User {
  late String username;

  User({required this.username});

  User.fromMap(Map<String, dynamic> map) {
    this.username = map["username"];
  }

  Map<String, dynamic> toMap() => {
        "username": username,
      };
}
