// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.childPhotoUrl,
    required this.userChild,
    required this.userMail,
    required this.userName,
  });

  String childPhotoUrl;
  String userChild;
  String userMail;
  String userName;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        childPhotoUrl: json["childPhotoUrl"],
        userChild: json["userChild"],
        userMail: json["userMail"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "childPhotoUrl": childPhotoUrl,
        "userChild": userChild,
        "userMail": userMail,
        "userName": userName,
      };
}
