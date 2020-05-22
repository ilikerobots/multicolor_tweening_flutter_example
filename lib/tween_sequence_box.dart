import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenSequenceBox extends StatefulWidget {
  const TweenSequenceBox({
    Key key,
  }) : super(key: key);

  @override
  _TweenSequenceBoxState createState() => _TweenSequenceBoxState();
}

class _TweenSequenceBoxState extends State<TweenSequenceBox>
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

  Animatable<Color> bgColor = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.red,
        end: Colors.blue,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.blue,
        end: Colors.green,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.green,
        end: Colors.yellow,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.yellow,
        end: Colors.red,
      ),
    ),
  ]);

  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            padding: EdgeInsets.all(24.0),
            decoration: BoxDecoration(color: _colorAnim.value),
            child: Text('Tween Sequence'),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
