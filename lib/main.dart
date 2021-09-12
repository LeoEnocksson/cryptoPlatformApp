import 'package:crypto_platform_app/request.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _futureBuilder());
  }

  _loginBackend() async {
    var loginData = await RequestHandler.testData();
    print(loginData);
    return loginData;
  }

  _futureBuilder() {
    return FutureBuilder<dynamic>(
      future: _loginBackend(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return Container(child: Text(snapshot.data));
        }
        return CircularProgressIndicator();
      },
    );
  }
}
