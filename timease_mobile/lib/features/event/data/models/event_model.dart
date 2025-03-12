class EventModel {
  String? id;
  User? user;
  String? title;
  String? description;
  String? location;
  int? duration;
  int? maxAttendees;
  int? schedulingRange;
  List<Availabilities>? availabilities;
  bool ?isPeriodic;

  EventModel(
      {this.id,
        this.user,
        this.title,
        this.description,
        this.location,
        this.duration,
        this.maxAttendees,
        this.schedulingRange,
        this.availabilities,
      this.isPeriodic
      });

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    title = json['title'];
    description = json['description'];
    location = json['location'];
    duration = json['duration'];
    maxAttendees = json['maxAttendees'];
    schedulingRange = json['schedulingRange'];
    isPeriodic = json['periodic'];
    if (json['availabilities'] != null) {
      availabilities = <Availabilities>[];
      json['availabilities'].forEach((v) {
        availabilities!.add(Availabilities.fromJson(v));
      });
    }
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
    data['periodic']=isPeriodic;
    if (availabilities != null) {
      data['availabilities'] =
          availabilities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? birthdate;
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

class Availabilities {
  String? id;
  String? dayOfWeek;
  String? startTime;
  String? date;
  String? endTime;

  Availabilities({this.id, this.dayOfWeek, this.startTime, this.endTime,this.date});

  Availabilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dayOfWeek = json['dayOfWeek'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dayOfWeek'] = dayOfWeek;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['date'] = date;
    return data;
  }
}