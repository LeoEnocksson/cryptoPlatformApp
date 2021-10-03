import 'package:crypto_platform_app/backend/api.dart';
import 'package:crypto_platform_app/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Crypto App'),
    );
  }
}
