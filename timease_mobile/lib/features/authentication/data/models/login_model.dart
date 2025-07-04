class LoginModel {
  String? accessToken;
  String? refreshToken;
  String? type;
  String? id;
  String? email;
  List<String>? roles;
  String? firstName;
  String? lastName;

  LoginModel(
      {this.accessToken,
        this.refreshToken,
        this.type,
        this.id,
        this.email,
        this.roles,
        this.firstName,
        this.lastName});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    type = json['type'];
    id = json['id'];
    email = json['email'];
    roles = json['roles'].cast<String>();
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['type'] = type;
    data['id'] = id;
    data['email'] = email;
    data['roles'] = roles;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}