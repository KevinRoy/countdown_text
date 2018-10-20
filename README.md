# countdown_text

A Flutter plugin about countdown
###初始化
```dart
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
            '获取验证码',
            onPressed: () {
              return true;
            },
          ),
        ),
       ),
    );
  }
}
```
![picture](https://github.com/KevinRoy/countdown_text/blob/master/screenshots/screen1.png)
###属性值
| 属性        | 说明           |
| ------------- |:-------------:|
| width      | 宽度 |
| height | 高度 |
| count | 倒计时数值 |
| radius | 圆角  |
| color | 按钮背景颜色 |
| disabledColor | 按钮点击后不可用状态背景颜色 |
| textColor | 字体大小 |
| fontSize | 字体颜色 |

```dart
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
            '获取验证码',
            count: 10,
            textColor: Colors.deepOrange,
            fontSize: 20.0,
            color: Colors.amber,
            radius: 20.0,
            disabledColor: Colors.black,
            width: 200.0,
            onPressed: () {
              return true;
            },
          ),
        ),
      ),
    );
  }
}
```
![picture](https://github.com/KevinRoy/countdown_text/blob/master/screenshots/screen2.png)
###tips
> * onPressed 有时候会遇到手机号不对，抑或没有输入手机号等等，当不执行倒计时，此时返回false

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).