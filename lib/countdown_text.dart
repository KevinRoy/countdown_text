import 'package:flutter/material.dart';

typedef OnPressedCallback = bool Function();

class CountdownText extends StatefulWidget {
  final OnPressedCallback onPressed;
  final String title;
  final double width;
  final double height;
  final int count;
  final double radius;
  final Color color;
  final Color disabledColor;
  final Color textColor;
  final double fontSize;

  CountdownText(this.title,
      {Key key,
      this.width,
      this.height,
      this.onPressed,
      this.count,
      this.radius,
      this.color,
      this.disabledColor,
      this.textColor,
      this.fontSize})
      : assert(title != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CountdownTextState();
  }
}

class CountdownTextState extends State<CountdownText>
    with TickerProviderStateMixin {
  static const int COUNT = 60;
  static const double RADIUS = 6.0;
  static const double FONTSIZE = 14.0;
  static const Color TEXTCOLOR = Color(0xffffffff);

  int count;
  AnimationController _controller;
  bool isClick;
  double radius;
  Color color;
  Color disabledColor;
  Color textColor;
  double fontSize;

  @override
  void initState() {
    isClick = true;

    count = widget.count ?? COUNT;
    radius = widget.radius ?? RADIUS;
    color = widget.color ?? Colors.blue;
    disabledColor = widget.disabledColor ?? Colors.grey;
    textColor = widget.textColor ?? TEXTCOLOR;
    fontSize = widget.fontSize ?? FONTSIZE;

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
      width: widget.width,
      height: widget.height,
      child: new RaisedButton(
        onPressed: isClick ? _onPressVoidCallback : null,
        color: color,
        disabledColor: disabledColor,
        child: new Padding(
          padding: new EdgeInsets.symmetric(vertical: 13.0),
          child: new Countdown(
            title: widget.title,
            isClick: isClick,
            animation: new StepTween(
              begin: count,
              end: 0,
            ).animate(_controller),
            textColor: textColor,
            fontSize: fontSize,
          ),
        ),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(radius),
        ),
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  Animation<int> animation;
  String title;
  bool isClick;
  Color textColor;
  double fontSize;

  Countdown(
      {Key key,
      this.animation,
      this.title,
      this.isClick,
      this.textColor,
      this.fontSize})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return new Text(
      isClick ? title : '${animation.value.toString()}s',
      textAlign: TextAlign.center,
      style: new TextStyle(color: textColor, fontSize: fontSize),
    );
  }
}
