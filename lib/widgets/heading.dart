import 'dart:ui';

import 'package:flutter/material.dart';

class Heading extends StatefulWidget {
  final String ? text;

  const Heading({Key? key, this.text}) : super(key: key);
  @override
  _HeadingState createState() => _HeadingState();
}

class _HeadingState extends State<Heading> with TickerProviderStateMixin {
  late AnimationController _colorController;
  Animatable<dynamic> background = TweenSequence<dynamic>([
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.red,
        end: Colors.green,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.green,
        end: Colors.blue,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.blue,
        end: Colors.pink,
      ),
    ),
    TweenSequenceItem(
      weight: 1.0,
      tween: ColorTween(
        begin: Colors.pink,
        end: Colors.red,
      ),
    ),]);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _colorController = AnimationController(vsync: this,duration: const Duration(seconds: 5),)
        ..addListener(() {
          setState(() {

          });
        })..addStatusListener((status) {
          if(status == AnimationStatus.completed){
            _colorController.forward(from: 0.0);
          }
        })..forward();
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   _colorController.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: 3.5,
              height: 22,
              color: background.evaluate(AlwaysStoppedAnimation(_colorController.value)),
            ),
            SizedBox(width: 4,),
            Text(
              widget.text!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 2,
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      );
  }
}