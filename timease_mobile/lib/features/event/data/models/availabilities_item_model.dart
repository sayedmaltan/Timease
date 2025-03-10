class AvailabilitiesItemModel {
  String? dayOfWeek;
  String? date;
  String? startTime;
  String? endTime;

  AvailabilitiesItemModel(
      {this.dayOfWeek, this.date, this.startTime, this.endTime});

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