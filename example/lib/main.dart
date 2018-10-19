import 'package:flutter/material.dart';
import 'package:countdown_text/countdown_text.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new Center(
          child: CountdownText(
            defaultTitle: '获取验证码',
            onPressed: () {
              return true;
            },
          ),
        ),
      ),
    );
  }
}
