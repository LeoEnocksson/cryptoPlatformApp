// To parse this JSON data, do
//
//     final AvgPriceResponseObject = AvgPriceResponseObjectFromJson(jsonString);

import 'dart:convert';

AvgPriceResponseObject avgPriceResponseObjectFromJson(String str) => AvgPriceResponseObject.fromJson(json.decode(str));

String avgPriceResponseObjectToJson(AvgPriceResponseObject data) => json.encode(data.toJson());

class AvgPriceResponseObject {
  AvgPriceResponseObject({
    required this.mins,
    required this.price,
  });

  int mins;
  String price;

  factory AvgPriceResponseObject.fromJson(Map<String, dynamic> json) => AvgPriceResponseObject(
        mins: json["mins"] == null ? null : json["mins"],
        price: json["price"] == null ? null : json["price"],
      );

  Map<String, dynamic> toJson() => {
        "mins": mins,
        "price": price,
      };
}
