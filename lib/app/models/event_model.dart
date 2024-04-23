import '../providers/api_endpoints.dart';

class Event {
  String? id;
  String? title;
  String? img;
  String? description;
  String? createdDate;

  Event({this.id, this.title, this.img, this.description});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['event_title'];
    img = "${Urls.baseUrl}storage/" + json['event_img'];
    description = json['event_description'];
    createdDate = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['img'] = this.img;
    data['description'] = this.description;
    return data;
  }
}
