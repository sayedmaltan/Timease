class CreateEventResponseModel {
  String? id;
  User? user;
  String? title;
  String? description;
  String? location;
  int? duration;
  int? maxAttendees;
  int? schedulingRange;
  Null availabilities;
  bool? periodic;

  CreateEventResponseModel(
      {this.id,
        this.user,
        this.title,
        this.description,
        this.location,
        this.duration,
        this.maxAttendees,
        this.schedulingRange,
        this.availabilities,
        this.periodic});

  CreateEventResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    title = json['title'];
    description = json['description'];
    location = json['location'];
    duration = json['duration'];
    maxAttendees = json['maxAttendees'];
    schedulingRange = json['schedulingRange'];
    availabilities = json['availabilities'];
    periodic = json['periodic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['title'] = title;
    data['description'] = description;
    data['location'] = location;
    data['duration'] = duration;
    data['maxAttendees'] = maxAttendees;
    data['schedulingRange'] = schedulingRange;
    data['availabilities'] = availabilities;
    data['periodic'] = periodic;
    return data;
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  Null birthdate;
  String? email;
  String? createdAt;
  String? modifiedAt;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.birthdate,
        this.email,
        this.createdAt,
        this.modifiedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    birthdate = json['birthdate'];
    email = json['email'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['birthdate'] = birthdate;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['modifiedAt'] = modifiedAt;
    return data;
  }
}