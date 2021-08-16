import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nft_marketplace/model/data.dart';
import 'package:nft_marketplace/utils/colors.dart';
var cardAspectRatio = 12.0 / 20.0;
var widgetAspectRatio = cardAspectRatio * 2.5;
class TrendingNft extends StatefulWidget {
  const TrendingNft({Key? key}) : super(key: key);

  @override
  _TrendingNftState createState() => _TrendingNftState();
}

class _TrendingNftState extends State<TrendingNft> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });

    return Stack(
      children: <Widget>[
        CardScrollWidget(currentPage),
        Positioned.fill(
          child: PageView.builder(
            itemCount: images.length,
            controller: controller,
            reverse: true,
            itemBuilder: (context, index) {
              return Container();
            },
          ),
        )
      ],
    );

  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft /1.7;

        List<Widget> cardList = [];

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  -10.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: Container(
               decoration:  BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 boxShadow: const [
                    BoxShadow(
                     color:  Colors.black26,
                     offset: Offset(3, 5),
                     blurRadius: 2,
                   ),
                 ],
               ),
              child: AspectRatio(
                aspectRatio: cardAspectRatio,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                        decoration:  ShapeDecoration(
                          //  color: categoryBig!.bgColor,
                            image: DecorationImage(
                                image: NetworkImage(images[i]),
                                fit: BoxFit.cover
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                side: BorderSide(color: wood_smoke, width: 2)),),
                   ),
                    // Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: <Widget>[
                    //       Padding(
                    //         padding: EdgeInsets.symmetric(
                    //             horizontal: 16.0, vertical: 8.0),
                    //         child: Text(title[i],
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontSize: 25.0,
                    //                 fontFamily: "SF-Pro-Text-Regular")),
                    //       ),
                    //       SizedBox(
                    //         height: 10.0,
                    //       ),
                    //       // Padding(
                    //       //   padding: const EdgeInsets.only(
                    //       //       left: 12.0, bottom: 12.0),
                    //       //   child: Container(
                    //       //     padding: EdgeInsets.symmetric(
                    //       //         horizontal: 22.0, vertical: 6.0),
                    //       //     decoration: BoxDecoration(
                    //       //         color: Colors.blueAccent,
                    //       //         borderRadius: BorderRadius.circular(20.0)),
                    //       //     child: Text("Read Later",
                    //       //         style: TextStyle(color: Colors.white)),
                    //       //   ),
                    //       // )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}