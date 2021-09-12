import 'dart:convert';

import 'package:http/http.dart' as http;

//ip4: - 192.168.1.84
//fake: - http://10.0.2.2:5000/
//real: - http://127.0.0.1:5000/

class RequestHandler {
  //Connect to pyCharm server and return the data.
  static Future getData() async {
    String url = 'http://127.0.0.1:5000/';
    final response = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      print(decodedData['query']);
      return decodedData;
    }
    return response.body;
  }

//Connecting to server - code taken from postman
  static testData() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://127.0.0.1:5000/')); //TODO: Något krånglar med uri/url:en. Kanske behöver specifiera ip adress.

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      await response.stream.bytesToString();
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
