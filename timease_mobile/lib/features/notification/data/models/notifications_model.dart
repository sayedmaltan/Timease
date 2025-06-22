class NotificationsModel {
  String? noOfNotifications;
  List<Notifications>? notifications;

  NotificationsModel({this.noOfNotifications, this.notifications});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    noOfNotifications = json['noOfNotifications'];
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['noOfNotifications'] = noOfNotifications;
    if (notifications != null) {
      data['notifications'] =
          notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  String? id;
  String? userId;
  String? title;
  String? message;
  String? notificationType;
  String? payload;
  String? createdAt;
  bool? isRead;
  bool? isSent;

  Notifications(
      {this.id,
        this.userId,
        this.title,
        this.message,
        this.notificationType,
        this.payload,
        this.createdAt,
        this.isRead,
        this.isSent});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    message = json['message'];
    notificationType = json['notificationType'];
    payload = json['payload'];
    createdAt = json['createdAt'];
    isRead = json['isRead']??false;
    isSent = json['isSent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['title'] = title;
    data['message'] = message;
    data['notificationType'] = notificationType;
    data['payload'] = payload;
    data['createdAt'] = createdAt;
    data['isRead'] = isRead;
    data['isSent'] = isSent;
    return data;
  }
}