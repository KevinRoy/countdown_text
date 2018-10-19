import 'package:flutter/material.dart';

typedef OnPressedCallback = bool Function();

class CountdownText extends StatefulWidget {
  OnPressedCallback onPressed;
  String defaultTitle;

  CountdownText({this.defaultTitle, this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return CountdownTextState();
  }
}

class CountdownTextState extends State<CountdownText>
    with TickerProviderStateMixin {
  static const int COUNT = 10;
  int count = COUNT;
  AnimationController _controller;
  bool isClick;

  @override
  void initState() {
    isClick = true;

    _controller = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: count),
    )..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          setState(() {
            isClick = true;
          });
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPressVoidCallback() {
    if (_controller.isAnimating) return;
    if (!widget.onPressed()) return;

    _controller.forward(from: 0.0);
    setState(() {
      isClick = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.0,
      height: 45.0,
      child: new RaisedButton(
        onPressed: isClick ? _onPressVoidCallback : null,
        color: Colors.blue,
        disabledColor: Colors.grey,
        child: new Padding(
          padding: new EdgeInsets.symmetric(vertical: 13.0),
          child: new Countdown(
            title: widget.defaultTitle,
            isClick: isClick,
            animation: new StepTween(
              begin: count,
              end: 0,
            ).animate(_controller),
          ),
        ),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation, this.title, this.isClick})
      : super(key: key, listenable: animation);
  Animation<int> animation;
  String title;
  bool isClick;

  @override
  Widget build(BuildContext context) {
    return new Text(
      isClick ? title : '${animation.value.toString()}s',
      textAlign: TextAlign.center,
      style: new TextStyle(color: Color(0xffffffff), fontSize: 14.0),
    );
  }
}
