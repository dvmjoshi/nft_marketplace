import 'package:flutter/material.dart';
import 'package:nft_marketplace/screens/collection_page.dart';
import 'package:nft_marketplace/screens/detail_page.dart';
import 'package:nft_marketplace/screens/homepage.dart';
import 'package:nft_marketplace/screens/start_page.dart';

class RouteGenerator {
  static const String homePage="/home";
  static const String startPage="/";
  static const String detailPage="/detailPage";
  static const String collectionPage="/collection";
  RouteGenerator._(){}
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case startPage:
      return MaterialPageRoute(builder: (_)=>const StartPage());
      case homePage:
        return MaterialPageRoute(builder: (_)=>const HomePage());
      case detailPage:
        return MaterialPageRoute(builder: (_)=>DetailPage());
      case collectionPage:
        return MaterialPageRoute(builder: (_)=>CollectionPage());
      default:
        throw const FormatException("Route not found");
    }
  }

}
