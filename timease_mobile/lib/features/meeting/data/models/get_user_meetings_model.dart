class GetUserMeetingsModel {
  int? meetingsNo;
  List<Meetings>? meetings;

  GetUserMeetingsModel({this.meetingsNo, this.meetings});

  GetUserMeetingsModel.fromJson(Map<String, dynamic> json) {
    meetingsNo = json['meetingsNo'];
    if (json['meetings'] != null) {
      meetings = <Meetings>[];
      json['meetings'].forEach((v) {
        meetings!.add(Meetings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meetingsNo'] = meetingsNo;
    if (meetings != null) {
      data['meetings'] = meetings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meetings {
  String? id;
  Availability? availability;
  String? date;
  String? startTime;
  String? endTime;
  List<Attendees>? attendees;
  bool? available;
  String? title;

  Meetings(
      {this.id,
      this.availability,
      this.date,
      this.startTime,
      this.endTime,
      this.attendees,
      this.available,
      this.title});

  Meetings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    availability = json['availability'] != null
        ? Availability.fromJson(json['availability'])
        : null;
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    if (json['attendees'] != null) {
      attendees = <Attendees>[];
      json['attendees'].forEach((v) {
        attendees!.add(Attendees.fromJson(v));
      });
    }
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (availability != null) {
      data['availability'] = availability!.toJson();
    }
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    if (attendees != null) {
      data['attendees'] = attendees!.map((v) => v.toJson()).toList();
    }
    data['available'] = available;
    return data;
  }
}

class Availability {
  String? id;
  String? dayOfWeek;
  String? date;
  String? startTime;
  String? endTime;

  Availability(
      {this.id, this.dayOfWeek, this.date, this.startTime, this.endTime});

  Availability.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dayOfWeek = json['dayOfWeek'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dayOfWeek'] = dayOfWeek;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    return data;
  }
}

class Attendees {
  String? id;
  String? firstName;
  String? lastName;
  Null birthdate;
  String? email;
  String? createdAt;
  String? modifiedAt;

  Attendees(
      {this.id,
      this.firstName,
      this.lastName,
      this.birthdate,
      this.email,
      this.createdAt,
      this.modifiedAt});

  Attendees.fromJson(Map<String, dynamic> json) {
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
