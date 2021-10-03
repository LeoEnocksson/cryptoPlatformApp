// To parse this JSON data, do
//
//     final ServerTimeResponseObject = ServerTimeResponseObjectFromJson(jsonString);

import 'dart:convert';

ServerTimeResponseObject serverTimeResponseObjectFromJson(String str) =>
    ServerTimeResponseObject.fromJson(json.decode(str));

String serverTimeResponseObjectToJson(ServerTimeResponseObject data) =>
    json.encode(data.toJson());

class ServerTimeResponseObject {
  ServerTimeResponseObject({
    required this.serverTime,
  });

  int serverTime;

  factory ServerTimeResponseObject.fromJson(Map<String, dynamic> json) =>
      ServerTimeResponseObject(
        serverTime: json["serverTime"] == null ? null : json["serverTime"],
      );

  Map<String, dynamic> toJson() => {
        "serverTime": serverTime,
      };
}
