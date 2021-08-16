import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_marketplace/model/nft_model.dart';
import 'package:nft_marketplace/screens/balance.dart';
import 'package:nft_marketplace/screens/trending_nft.dart';
import 'package:nft_marketplace/utils/hexcolor.dart';
import 'package:nft_marketplace/widgets/footer.dart';
import 'dart:ui' as ui;
import 'package:nft_marketplace/widgets/header_home_page.dart';
import 'package:nft_marketplace/widgets/heading.dart';
import 'package:nft_marketplace/widgets/home_cardpage.dart';
import 'package:nft_marketplace/widgets/uihelper.dart';

import 'nft_art.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late NftModel nftModel;
  late AnimationController _controller;
  late PageController _pageController;
  late int _indexPage;
  late int _currentIndex;
  late bool _enableAddCreditCard;
  double _blueBgTranslatePercent = 1.0;
  double _blueBgTransitionPercent = 1.0;
  bool _hideByVelocity = false;

  // Data


  @override
  void initState() {

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _indexPage = 1;
    _currentIndex = 1;
    _enableAddCreditCard = false;
    // Data

    super.initState();
  }



  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (_currentIndex > 0) {
      if (details.primaryDelta! > 0.0) {
        _controller.value += 0.020;
      } else {
        _controller.value -= 0.020;
      }

      if (details.primaryDelta! > -1.5) {
        _hideByVelocity = false;
      } else {
        _hideByVelocity = true;
        _controller.reverse();
      }
    }
    setState(() {});
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_currentIndex >= 0) {
      if (_controller.value < 0.2 || _hideByVelocity) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.grey.shade900,
      body: SafeArea(
        child:SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children:<Widget> [
               const GreetingWidget(),
              Heading(text: "Trending in Galaxy",),
              const TrendingNft(),
              Heading(text: "Collection",),
              const ShoppingCardPager(),
              Heading(text:"NFT Art"),
              // ListView.builder(
              //
              //     itemCount:nftList.length,
              //     itemBuilder: (_,index){
              //       return NftArtList(nftModel:nftList[index]);
              //     }),
              ListView(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children:nftList.map((list) => NftArtList(nftModel: list)).toList()),
              Footer(),

            ],
          ),
        )
      ),
    );
  }
}