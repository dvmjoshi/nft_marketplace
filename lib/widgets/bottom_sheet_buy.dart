import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nft_marketplace/animations/siwpe_button.dart';
import 'package:nft_marketplace/screens/balance.dart';
import 'package:nft_marketplace/utils/colors.dart';
import 'package:nft_marketplace/widgets/balance_card.dart';
import 'package:nft_marketplace/widgets/button_plain.dart';
import 'package:confetti/confetti.dart';
class NftBuyButton extends StatefulWidget {
  String  text;
  double  price;
  NftBuyButton({Key? key,required this.text, required this.price}) : super(key: key);

  @override
  State<NftBuyButton> createState() => _NftBuyButtonState();
}

class _NftBuyButtonState extends State<NftBuyButton> {
  late ConfettiController _controllerCenter;
  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 4));
    super.initState();
  }
  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
      color: Colors.white70,
    );
    return  Container(
      child:  Padding(
        padding: const EdgeInsets.only(left: 0, bottom: 0,top: 8),
        child: ButtonPlain(
          color: wood_smoke,
          borderColor: wood_smoke,
          textColor: white,
          text: widget.text,
          size: 96,
          onTap: () {
            showModalBottomSheet(
                context: context,
               backgroundColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                ),
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Container(
                         height: 400,

                        decoration: BoxDecoration(
                         color: Colors.grey.shade900,
                          // image:  const DecorationImage(
                          //   image: NetworkImage("https://cdn.dribbble.com/users/2443968/screenshots/7027843/media/5f573e7904313c85d575f014d74bb99a.jpg?compress=1&resize=800x600"),
                          //   fit: BoxFit.cover,
                          // ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: .0,
                            sigmaY: .0,
                          ),
                          child: Column(
                           // crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.start,
                          //  mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(height: 10,),
                          Row(
                           // crossAxisAlignment: CrossAxisAlignment.start,
                           // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:8.0),
                                child: BalanceCard(onItemPressed: (){},),
                              ),

                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ConfettiWidget(
                              confettiController: _controllerCenter,
                              blastDirectionality: BlastDirectionality
                                  .explosive, // don't specify a direction, blast randomly
                              shouldLoop:
                              true, // start again as soon as the animation is finished
                              colors: const [
                                Colors.green,
                                Colors.blue,
                                Colors.pink,
                                Colors.orange,
                                Colors.purple
                              ], // manually specify the colors to be used
                              createParticlePath: drawStar, // define a custom shape/path.
                            ),
                          ),
                              SizedBox(height: 10,),
                              Text('Buy Nft At'.toUpperCase(), style: textStyle),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height:30,
                                      width: 40,
                                      child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png")),
                                  Text(
                                     "${widget.price}",
                                      style: TextStyle(
                                        fontSize: 47,
                                        color: Colors.grey.withOpacity(0.5),
                                        fontWeight: FontWeight.w300,
                                      )
                                  ),
                                ],
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SwipeButton(
                                    initialPosition: SwipePosition.SwipeLeft,
                                    thumb: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child:Image.asset("assets/coin.png"),

                                    ),
                                    content: Center(
                                      child: Row(
                                        children: [
                                          SizedBox(width: 10,),
                                          const Text(
                                            "Swipe to Buy",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Image.asset("assets/pay.png"),
                                          )
                                        ],
                                      ),
                                    ),
                                    onChanged: (result){
                                      _controllerCenter.play();
                                      Timer(Duration(seconds:3), (){
                                        Navigator.of(context).pop();
                                      });

                                    },

                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ) ,
    );
  }
}
