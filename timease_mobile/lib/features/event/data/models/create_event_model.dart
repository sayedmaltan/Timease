
class CreateEventModel {
  String? title;
  String? description;
  String? location;
  int? duration;
  int? maxAttendees;
  int? schedulingRange;
  List<AvailabilitiesItemModel>? availabilities;
  bool? periodic;

  CreateEventModel(
      {this.title,
        this.description,
        this.location,
        this.duration,
        this.maxAttendees,
        this.schedulingRange,
        this.availabilities,
        this.periodic});

  CreateEventModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    location = json['location'];
    duration = json['duration'];
    maxAttendees = int.parse(json['maxAttendees']);
    schedulingRange = json['schedulingRange']!=null?int.parse(json['schedulingRange']):null;
    if (json['availabilities'] != null) {
      availabilities = <AvailabilitiesItemModel>[];
      json['availabilities'].forEach((v) {
        availabilities!.add(AvailabilitiesItemModel.fromJson(v));
      });
    }
    periodic = json['periodic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['location'] = location;
    data['duration'] = duration;
    data['maxAttendees'] = maxAttendees;
    data['schedulingRange'] = schedulingRange;
    if (availabilities != null) {
      data['availabilities'] =
          availabilities!.map((v) => v.toJson()).toList();
    }
    data['periodic'] = periodic;
    return data;
  }
}

class AvailabilitiesItemModel {
  String? dayOfWeek;
  String? date;
  String? startTime;
  String? endTime;

  AvailabilitiesItemModel({this.dayOfWeek, this.date, this.startTime, this.endTime});

  AvailabilitiesItemModel.fromJson(Map<String, dynamic> json) {
    dayOfWeek = json['dayOfWeek'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dayOfWeek'] = dayOfWeek;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    return data;
  }
}
