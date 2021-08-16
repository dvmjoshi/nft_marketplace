import 'dart:async';

import 'package:flutter/material.dart';

class SpaceLetter extends StatefulWidget {
  final  String name ;
  final double opacity ;
  final double height ;
  final double width ;
  final double fontsize;
  final double iconsize;
  const SpaceLetter( {Key? key,  required this.name,required this.width,
    required this.height,required this.opacity, required this.fontsize, required this.iconsize}) : super(key: key);
  @override
  _SpaceLetterState createState() => _SpaceLetterState();
}

class _SpaceLetterState extends State<SpaceLetter> {
  double elevation = 10;
  double letterSpacingBegin = 1;
  double letterSpacingEnd = 1;

  bool isPressed = false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
    isPressed=true;
       if(isPressed==true){
         setState(() {
           elevation = 0;
           letterSpacingBegin = 1;
           letterSpacingEnd = 20;
           isPressed = true;
         });
       }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(

        onTapDown: (d) {
          setState(() {
            elevation = 0;
            letterSpacingBegin = 1;
            letterSpacingEnd = 20;
            isPressed = true;
          });
        },
        onTapUp: (d) {
          setState(() {
            elevation = 10;
            letterSpacingBegin = 20;
            letterSpacingEnd = 1;
            isPressed = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: MediaQuery.of(context).size.width - widget.width,
          height: widget.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isPressed ? Colors.white.withOpacity(widget.opacity) : Color.fromRGBO(45, 45, 45, 1),
            boxShadow: [
              BoxShadow(
                color: isPressed ? Colors.black12 : Colors.black26,
                offset: Offset(0, 10),
                blurRadius: 20,
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(Icons.verified_rounded,color: Colors.black12.withOpacity(0.4),size: widget.iconsize,),
              ),
              TweenAnimationBuilder(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 1000),
                tween: Tween<double>(begin: letterSpacingBegin, end: letterSpacingEnd),
                builder: (context, double letterSpacing, child) {
                  return Text(
                 widget.name,
                    style: TextStyle(
                      color: isPressed ? const Color.fromRGBO(45, 45, 45, 1) : Colors.white,
                      fontSize: widget.fontsize,
                      letterSpacing: letterSpacing,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );

  }
}