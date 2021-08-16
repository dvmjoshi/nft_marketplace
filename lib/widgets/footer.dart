import 'package:flutter/material.dart';
import 'package:nft_marketplace/widgets/uihelper.dart';
class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left:15.0,right:15,top:10,bottom:0),
      height: 400.0,
      decoration: BoxDecoration(
          color: Colors.grey[200],
        image: const DecorationImage(
          image: NetworkImage("https://cdn.dribbble.com/users/1021976/screenshots/4551725/dribbble.gif"),
          fit: BoxFit.cover,
        )
      ),
      child: Stack(
        children: <Widget>[
          // Transform.rotate(
          //   angle:-0.1,
          //   child: Align(
          //     alignment: Alignment.bottomRight,
          //     child:Padding(
          //       padding: const EdgeInsets.only(left:199.0),
          //       child: Lottie.network("https://firebasestorage.googleapis.com/v0/b/grasp-14bf5.appspot.com/o/uttarakhand%2F3010-bb8%20(1).json?alt=media&token=7e7f28e0-5ba0-4cc1-b478-387f87a9763e",height: 390,width: 350,),
          //     ),
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Learn\nElevate\nDiscover',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(
                  color: Colors.grey[400],
                  fontSize: 60.0,
                  letterSpacing: 0.2,
                  height: 0.9,
                ),
              ),
              UIHelper.verticalSpaceLarge(),
              Text(
                'Made with ❤',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey),
              ),
              Text(
                'By Divyam Joshi',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey),
              ),
              UIHelper.verticalSpaceExtraLarge(),

            ],
          ),

        ],
      ),
    );
  }
}
