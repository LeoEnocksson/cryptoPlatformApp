import 'dart:convert';

import 'package:crypto_platform_app/models/avg_price.dart';
import 'package:http/http.dart' as http;

import '../models/server_time.dart';

class API {
  ///[getServerTime] calls binance API and gets the latest time.
  static Future getServerTime() async {
    try {
      String url = 'https://api.binance.com/api/v3/time';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        ServerTimeResponseObject responseObject =
            ServerTimeResponseObject.fromJson(json.decode(response.body));
        return responseObject.serverTime;
      }
    } catch (e) {
      return null;
    }
  }

  ///[getLatestAvgPrice] calls binance API and gets the latest avg price of bitcoin.
  static Future getLatestAvgPrice() async {
    try {
      String url = 'https://api.binance.com/api/v3/avgPrice?symbol=BNBBTC';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        AvgPriceResponseObject avgPriceResponseObject =
            AvgPriceResponseObject.fromJson(json.decode(response.body));
        return avgPriceResponseObject;
      }
    } catch (e) {
      return null;
    }
  }
}
