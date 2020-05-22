import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multicolor_tweening_in_flutter/tween_sequence_box.dart';
import 'package:multicolor_tweening_in_flutter/rainbow_color_tween_box.dart';
import 'package:multicolor_tweening_in_flutter/rainbow_box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: DefaultTextStyle(
        style: TextStyle(
          inherit: true,
          fontSize: 20.0,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TweenSequenceBox(),
              RainbowColorTweenBox(),
              RainbowBox(),
            ],
          ),
        ),
      ),
    );
  }
}
