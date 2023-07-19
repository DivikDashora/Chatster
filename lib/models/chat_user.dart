class chatUser {
  chatUser({
    required this.image,
    required this.about,
    required this.name,
    required this.createdAt,
    required this.isOnline,
    required this.ID,
    required this.lastOnline,
    required this.pushToken,
    required this.email,
  });
  late final String image;
  late final String about;
  late final String name;
  late final String createdAt;
  late final bool isOnline;
  late final String ID;
  late final String lastOnline;
  late final String pushToken;
  late final String email;

  chatUser.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    about = json['about'];
    name = json['name'];
    createdAt = json['created_at'];
    isOnline = json['is_online'];
    ID = json['ID'];
    lastOnline = json['last_online'];
    pushToken = json['push_token'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['about'] = about;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['is_online'] = isOnline;
    data['ID'] = ID;
    data['last_online'] = lastOnline;
    data['push_token'] = pushToken;
    data['email'] = email;
    return data;
  }
}
