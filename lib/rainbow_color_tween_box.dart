import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainbow_color/rainbow_color.dart';

class RainbowColorTweenBox extends StatefulWidget {
  const RainbowColorTweenBox({
    Key key,
  }) : super(key: key);

  @override
  _RainbowColorTweenBoxState createState() => _RainbowColorTweenBoxState();
}

class _RainbowColorTweenBoxState extends State<RainbowColorTweenBox>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )
      ..forward()
      ..repeat();
    _colorAnim = bgColor.animate(_controller);
  }

  Animatable<Color> bgColor = RainbowColorTween([
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.red,
  ]);

  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
              padding: EdgeInsets.all(24.0),
              decoration: BoxDecoration(color: _colorAnim.value),
              child: Text('RainbowColorTween'));
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
