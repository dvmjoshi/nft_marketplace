import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_marketplace/animations/letter_spacing.dart';
import 'package:nft_marketplace/model/nft_model.dart';
import 'package:nft_marketplace/screens/detail_page.dart';
import 'package:nft_marketplace/utils/colors.dart';
import 'package:nft_marketplace/widgets/bottom_sheet_buy.dart';
import 'package:nft_marketplace/widgets/button_plain.dart';
import 'package:nft_marketplace/widgets/video_player.dart';
class NftArtList extends StatelessWidget {
  final NftModel nftModel;

  const NftArtList({Key? key, required this.nftModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return     Padding(
      padding: const EdgeInsets.all(18.0),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) => HeroDetail()),
          // );
        },
        child: Center(
          child: Stack(
            children: [
              InkWell(
                onDoubleTap: (){
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1000),
                      pageBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return DetailPage(image: nftModel.nftImage,video1: nftModel.video,videourl: nftModel.nftVideo,
                        price: nftModel.price,username: nftModel.userName,name:nftModel.nftName ,);
                      },
                      transitionsBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return Align(
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                    ),
                  );
                },
                onTap: (){
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1000),
                      pageBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return DetailPage(image: nftModel.nftImage,video1: nftModel.video,videourl: nftModel.nftVideo,
                          price: nftModel.price,username: nftModel.userName,name:nftModel.nftName ,);
                      },
                      transitionsBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return Align(
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                    ),
                  );
                 // Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailPage(image: nftModel.nftImage,)));
                },
                child: Hero(
                  tag: "haaa",
                  child: Container(

                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                      image:  DecorationImage(
                        image: NetworkImage(nftModel.nftImage),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SpaceLetter(name: nftModel.userName,opacity: 0.6,height: 20,
                        width: 220,fontsize: 12,iconsize: 15,),
                      ),
                    ),
                  )
                ),
              ),
              Positioned(
                height: 100,
                width: 350,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(11),
                    bottomRight: Radius.circular(11),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 16,
                      sigmaY: 16,
                    ),
                    child: Container(
                      color: Colors.grey[600]!.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right:0,bottom: 0,top: 8),
                        child: Text(
                          nftModel.nftName,
                          style: textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      //Ymargin(4),
                      Container(

                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                        //  crossAxisAlignment: CrossAxisAlignment.end,
                     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0,right:0,bottom: 0,top: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight:Radius.circular(12),topRight: Radius.circular(12)),
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0,right:8,bottom: 2,top: 4),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(

                                          nftModel.sellType,
                                          style: textTheme.caption!.copyWith(
                                            color: Colors.white,
                                            fontFamily: 'WorkSans',
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                              height:30,
                                              width: 40,
                                              child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png")),
                                          Text(

                                            "${nftModel.price}",
                                            style: textTheme.caption!.copyWith(
                                              color: Colors.white,
                                              fontFamily: 'WorkSans',
                                              fontSize: 23
                                            ),

                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 100,),
                            NftBuyButton(text: nftModel.buttonType,price:nftModel.price),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
