import 'package:crypto_platform_app/models/avg_price.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../backend/api.dart';

///Declaration of a class called [MyHomePage].
class MyHomePage extends StatefulWidget {
  ///[MyHomePage] takes a [String] [title] as a optional parameter in its class constructor.
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///Start of the class.
  @override
  Widget build(BuildContext context) {
    ///[return] is a keyword that basically means 'return this item'.
    return _scaffold();
  }

  ///[_scaffold] is where the UI content is placed inside.
  ///
  ///[_scaffold] has an underscore "_" in front of it. This means that it is 'private'.
  ///
  ///'Private' means that it can only be called upon from this specific class/file.
  _scaffold() {
    return Scaffold(

        ///[AppBar] is the bar att the top of the screen.
        appBar: AppBar(
          ///Has the title 'Crypto App'.
          title: Text(widget.title),
        ),

        ///[body] is the remaining content of the screen.
        body: _body());
  }

  ///[_body] is the body of [Scaffold].
  _body() {
    ///A [Container] takes a [child] which can contain a UI element.
    ///
    ///A [Container] is useful if you want to specify the size of the UI element etc.
    return Container(
      ///A [Row] takes a number of [children] which is placed in a vertical direction.
      child: Column(
        ///[MainAxisAlignment.center] places the children in the middle of the screen.
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _futureBuilderTime(),
          _futureBuilderAvgPrice(),
        ],
      ),
    );
  }

/***************************/

/*    API Future methods   */

/***************************/

  ///Calls [API.getServerTime] and gets the latest [ResponseObject.serverTime].
  Future _getServerTime() async {
    ///[API.getServerTime] is a class method in the class [API].
    ///
    ///It is set to static, which means we can call it from any other class.
    ///
    ///This is basically the opposite to the private keyword of underscore "_".
    final loginData = await API.getServerTime();
    return loginData;
  }

  ///Calls [API.getServerTime] and gets the latest [ResponseObject.serverTime].
  Future _getAvgPrice() async {
    final loginData = await API.getLatestAvgPrice();
    return loginData;
  }

/***************************/

/*       FutureBuilders    */

/***************************/

  ///[FutureBuilder] fetching time data from [API.getServerTime].
  _futureBuilderTime() {
    return Container(
      child: FutureBuilder<dynamic>(
        future: _getServerTime(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return _serverTimeText(data: snapshot.data);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  ///[FutureBuilder] fetching time data from [API.getLatestAvgPrice].
  _futureBuilderAvgPrice() {
    return Container(
      child: FutureBuilder<dynamic>(
        future: _getAvgPrice(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return _avgPriceText(data: snapshot.data);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

/***************************/

/*   UI elements/Widgets   */

/***************************/

  ///The widget [_serverTimeText] returns a [Text] Widget.
  ///
  ///A Widget is a UI element.
  ///
  ///Every UI element in Flutter is a Widget.
  Widget _serverTimeText({data}) {
    final String serverTime =

        ///Here we set the value of the variable [serverTime] depending on if data is null or not.
        data == null ? 'No connection to server' : data.toString();

    ///Null means nothing in programming.

    ///Returns a container with a text widget representing the [serverTime].
    return Container(child: Center(child: Text('Server time: ' + serverTime)));
  }

  ///The widget [_avgPriceText] returns a [Text] Widget.
  Widget _avgPriceText({data}) {
    final AvgPriceResponseObject latestAvgPrice =

        ///Here we set the value of the variable [latestAvgPrice] depending on if data is null or not.
        data == null ? 'No connection to server' : data;

    ///Returns a container with two text widgets representing the avg price and mins.
    return Container(
      child: Column(
        children: [
          Text('Latest avg price: ' + latestAvgPrice.price),
          Text('Latest avg mins: ' + '${latestAvgPrice.mins}'.toString()),
        ],
      ),
    );
  }
}
