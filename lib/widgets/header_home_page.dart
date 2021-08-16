import 'package:flutter/material.dart';
import 'package:nft_marketplace/animations/letter_spacing.dart';
import 'package:nft_marketplace/screens/balance.dart';
import 'dart:ui' as ui;

import 'package:nft_marketplace/screens/profile_page.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return
      Container(
        decoration: const BoxDecoration(
         // color: const Color.fromRGBO(45, 45, 45, 1).withOpacity(.99),
          image:  DecorationImage(
            image: AssetImage("assets/batman.png"),
            fit: BoxFit.contain,
          ),
        ),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment:MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    'NFT Marketplace',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient),
                  ),
                SizedBox(width: 10,),
                  // Text.rich(
                  //   TextSpan(
                  //     text: 'Hello',
                  //     children: [
                  //       TextSpan(
                  //           text: ' ${"divyam".split(' ').first}',
                  //           style: TextStyle(fontWeight: FontWeight.bold)),
                  //     ],
                  //   ),
                  //   style: TextStyle(
                  //     fontSize: 30,
                  //   ),
                  // ),
                  const Spacer(),
                    InkWell(
                     onTap: (){
                       Navigator.of(context).push(PageRouteBuilder(
                           pageBuilder: (context, animation, _) {
                             return SecondScreen();
                           },
                           opaque: false));
                     },


                     child: const CircleAvatar(
                       radius: 20,
                       backgroundImage: NetworkImage(
                           "https://cdn.dribbble.com/users/2311205/screenshots/4841572/060_s.jpg?compress=1&resize=800x600"),
                     ),
                   )

                  // Container(
                  //   width: 60,
                  //   height: 60,
                  //   decoration: const BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: Colors.white,
                  //   ),
                  //   child: const Icon(
                  //     Icons.credit_card,
                  //  //   color: BankColors.kLessDarkBlue,
                  //   ),
                  // )
                ],
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: SpaceLetter(name: 'DIVYAM',fontsize: 14,width: 200,height: 30,
                  opacity: 0.4,iconsize: 20,),
                ),
              ),
              const SizedBox(height: 15,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height:6,
                    width: 35,
                    decoration: BoxDecoration(
                    color: Colors.black26,
    borderRadius: BorderRadius.circular(12.0)),
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
