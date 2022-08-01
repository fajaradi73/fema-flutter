class User {
  User({
    this.username,
    this.token,
    this.refreshToken,
  });

  User.fromJson(Map json) {
    username = json['username'];
    token = json['token'];
    refreshToken = json['refresh_token'];
  }

  String? username;
  String? token;
  String? refreshToken;

  Map<String, String> toJson() {
    final map = <String, String>{};
    map['username'] = username ?? "";
    map['token'] = token ?? "";
    map['refresh_token'] = refreshToken ?? "";
    return map;
  }
}
