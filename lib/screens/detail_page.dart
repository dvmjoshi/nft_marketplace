
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft_marketplace/utils/colors.dart';
import 'package:nft_marketplace/utils/hexcolor.dart';
import 'package:nft_marketplace/widgets/bottom_sheet_buy.dart';
import 'package:nft_marketplace/widgets/button_around.dart';
import 'package:nft_marketplace/widgets/button_plain.dart';
import 'package:nft_marketplace/widgets/contra_text.dart';
import 'package:nft_marketplace/widgets/video_player.dart';

class DetailPage extends StatefulWidget {
  final String? image;
  final String ? videourl;
  final String ? name;
  final double ? price;
  final String ? username ;
  bool ? video1;
   DetailPage({Key? key,this.image,this.video1,this.videourl,this.price,this.name,this.username}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  String feel = "0";
  double _value = 0.0;
  double lastsection = 0.0;
  String feedbacktxt = "Very Poor";
  Color backgroundclr = Colors.red;
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Container(
                //   height: kToolbarHeight + statusBarHeight,
                // //  color: lightening_yellow,
                // ),
             Container(
               child: (widget.video1)==false? Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                   // color: lightening_yellow,
                    child:Hero(
                      tag:"haaa",
                      child: Image.network(widget.image!,
                      fit: BoxFit.cover,),
                    ),
                  ):Container(
                 height: 400,
                 width: MediaQuery.of(context).size.width,
                 // color: lightening_yellow,
                 child:Hero(
                   tag:"haaa",
                   child:NftVideoPlayer(url: widget.videourl,),
                 ),
               ),
             ),
                Container(
               //   color: HexColor("#63B9AF").withOpacity(0.6),
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: <Widget>[
                      ContraText(
                        alignment: Alignment.centerLeft,
                        size: 27,
                        text: widget.name,
                      ),
                      const SizedBox(
                        height: 2,
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "by ${widget.username}",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: trout,
                              fontSize: 17,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "In this world, wherever there is light - there are also shadows. As long as the concept of winners exists, there must also be losers. "
                            "The selfish desire of wanting to maintain peace causes wars, and hatred is born to protect love",
                        style: TextStyle(
                            color: trout,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      const ContraText(
                        alignment: Alignment.centerLeft,
                        text: "Price",
                        size: 15,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                                height:30,
                                width: 40,
                                child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png")),
                            Text(
                               "${widget.price}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: const Divider(
                          color: wood_smoke,
                          thickness: 3,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      NftBuyButton(text: "Buy Now",price: widget.price!,),

                      const SizedBox(
                        height: 16,
                      ),

                      const ContraText(
                        alignment: Alignment.centerLeft,
                        text: "Rate It",
                        size: 15,
                      ),
                      Column(

                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all( 10),
                            child: Text(
                              feedbacktxt,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            height: 250,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: FlareActor(
                                'assets/flares/feelings.flr',
                                fit: BoxFit.contain,
                                //alignment: Alignment.Center,
                                animation: feel,
                              ),
                            ),
                          ),

                          Slider(
                            min: 0.0,
                            max: 100.0,
                            value: _value,
                            divisions: 100,
                            activeColor: Colors.blue,
                            inactiveColor: Colors.black.withOpacity(0.6),
                            label: feedbacktxt,
                            onChanged: (val) {
                              setState(() {
                                _value = val;
                              });
                              if (_value == 0.0) {
                                if (lastsection > 0.0) {
                                  setState(() {
                                    feel = "0-";
                                  });
                                }
                                setState(() {
                                  lastsection = 0.0;
                                  backgroundclr = Colors.red;
                                  feedbacktxt = "Very Good";
                                });
                              } else if (_value > 0.0 && _value < 25.0) {
                                if (lastsection == 0.0) {
                                  setState(() {
                                    feel = "0+";
                                  });
                                } else if (lastsection == 50.0) {
                                  setState(() {
                                    feel = "25-";
                                  });
                                }
                                setState(() {
                                  lastsection = 25.0;
                                  backgroundclr = Colors.orange;
                                  feedbacktxt = "Good";
                                });
                              } else if (_value >= 25.0 && _value < 50.0) {
                                if (lastsection == 25.0) {
                                  setState(() {
                                    feel = "25+";
                                  });
                                } else if (lastsection == 75.0) {
                                  setState(() {
                                    feel = "50-";
                                  });
                                }
                                setState(() {
                                  lastsection = 50.0;
                                  backgroundclr = Colors.orangeAccent;
                                  feedbacktxt = "Cool";
                                });
                              } else if (_value >= 50.0 && _value < 75.0) {
                                if (lastsection == 50.0) {
                                  setState(() {
                                    feel = "50+";
                                  });
                                } else if (lastsection == 100.0) {
                                  setState(() {
                                    feel = "75-";
                                  });
                                }
                                setState(() {
                                  lastsection = 75.0;
                                  backgroundclr = Colors.yellow;
                                  feedbacktxt = "Wow";
                                });
                              } else if (_value >= 75.0 && _value <= 100.0) {
                                if (lastsection == 75.0) {
                                  setState(() {
                                    feel = "75+";
                                  });
                                }
                                setState(() {
                                  lastsection = 100.0;
                                  backgroundclr = Colors.green;
                                  feedbacktxt = "MasterPiece";
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 24,
            top: kToolbarHeight + statusBarHeight-40,
            child: ButtonRoundWithShadow(
              size: 48,
              borderColor: wood_smoke,
              color: white,
              callback: () {
                Navigator.pop(context);
              },
              shadowColor: wood_smoke,
            ),
          )

        ],
      ),
    );
  }
}
