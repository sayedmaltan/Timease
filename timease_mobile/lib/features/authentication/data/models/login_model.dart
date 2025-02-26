class LoginModel {
  LoginModel({
    this.accessToken,
    this.refreshToken,
    this.type,
    this.id,
    this.email,
    this.roles,
  });

  LoginModel.fromJson(dynamic json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    type = json['type'];
    id = json['id'];
    email = json['email'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : [];
  }

  String? accessToken;
  String? refreshToken;
  String? type;
  String? id;
  String? email;
  List<String>? roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    map['type'] = type;
    map['id'] = id;
    map['email'] = email;
    map['roles'] = roles;
    return map;
  }
}
