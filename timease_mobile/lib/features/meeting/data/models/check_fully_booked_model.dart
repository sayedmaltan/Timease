class CheckFullyBookedModel {
  int? meetingsNo;
  List<FullyBooked>? fullyBooked;

  CheckFullyBookedModel({this.meetingsNo, this.fullyBooked});

  CheckFullyBookedModel.fromJson(Map<String, dynamic> json) {
    meetingsNo = json['meetingsNo'];
    if (json['fullyBooked'] != null) {
      fullyBooked = <FullyBooked>[];
      json['fullyBooked'].forEach((v) {
        fullyBooked!.add(FullyBooked.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meetingsNo'] = meetingsNo;
    if (fullyBooked != null) {
      data['fullyBooked'] = fullyBooked!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FullyBooked {
  String? startTime;

  FullyBooked({this.startTime,});

  FullyBooked.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startTime'] = startTime;
    return data;
  }
}