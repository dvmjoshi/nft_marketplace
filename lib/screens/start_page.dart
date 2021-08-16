import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nft_marketplace/animations/image_animation.dart';
import 'package:nft_marketplace/routes.dart';
import 'package:nft_marketplace/widgets/bottom_left_clipper_bottom.dart';
import 'package:nft_marketplace/widgets/clip_shadow_path.dart';
import 'package:nft_marketplace/widgets/top_right_cipper_bottom.dart';
import 'package:nft_marketplace/widgets/top_right_clipper.dart';

import 'package:transparent_image/transparent_image.dart';

const kNeumorphicColor = Color.fromRGBO(235, 228, 229, 1); // rgb(235, 228, 229)

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  void startTimer() {
    Timer(Duration(seconds: 3), () async {
      Navigator.of(context).pushReplacementNamed(RouteGenerator.homePage);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const boxShadow = BoxShadow(
      color: Colors.grey,
      offset: Offset(-5, 3),
      blurRadius: 5,
      spreadRadius: 10,
    );
    final widthNeuContainer = Container(
      width: width * 0.99,
      color: Colors.grey.shade900,
    );


    final heightNeuContainer = Container(
      height: height * 0.99,
      color: Colors.grey.shade900,
    );

    return Material(
      color: Colors.grey.shade900,
      child: Stack(

        children: <Widget>[
          Align(
            child: ClipShadowPath(
              shadow: boxShadow,
              clipper: TopRightNeuClipperBtm(),
              child: widthNeuContainer,
            ),
          ),
          Align(
            alignment: Alignment(30, -1),
            child: ClipShadowPath(
              shadow: boxShadow,
              clipper: TopRightClipper(),
              child: widthNeuContainer,
            ),
          ),
          Align(
            alignment: Alignment(0, 30.5),
            child: ClipShadowPath(
              shadow: boxShadow,
              clipper: BottomLeftNeuClipperBtm(),
              child: heightNeuContainer,
            ),
          ),
          const Align(
            alignment: Alignment(0, 9),
            child: ImageAnimation(),
          ),
          // Align(
          //   alignment: Alignment(0, 120.5),
          //   child: ClipShadowPath(
          //     shadow: boxShadow,
          //     clipper: BottomLeftNeuClipper(),
          //     child: heightNeuContainer,
          //   ),
          // ),
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 50,left: 10),
              child:    Text(
                'Toward Decentralized World',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 58.0),
              child: SizedBox(
                width: width * 0.8,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteGenerator.homePage);
                  },
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: Theme.of(context).textTheme.headline1!.color,
                  child: const Text(
                    'Let\'s Get Started ',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
