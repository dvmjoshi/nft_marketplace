import 'package:flutter/material.dart';
class BalanceCard extends StatelessWidget {
  const BalanceCard({Key? key, required this.onItemPressed}) : super(key: key);

  final VoidCallback onItemPressed;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
      color: Colors.white70,
    );

    return InkWell(
      onTap: onItemPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * .70,
        height: 155,
        padding: EdgeInsets.all(12),
       // margin: EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade900,
            borderRadius:const BorderRadius.only(topRight: Radius.circular(32),bottomRight: Radius.circular(32)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 16,
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your'.toUpperCase(), style: textStyle),
                    SizedBox(height: 6),
                    Text('Balance'.toUpperCase(), style: textStyle),
                  ],
                ),
                Container(
                  height: 50,
                  child: Image.asset("assets/payment.png"),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:2),
              child: RichText(
//$
                  text: TextSpan(
                    text: '\$',
                    style: TextStyle(
                      fontSize: 47,
                      color: Colors.grey.withOpacity(0.5),
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
//20
//                                   TextSpan(
//                                     text: money,
//                                     style: TextStyle(
//                                       fontSize: 60,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//.0
                      TextSpan(
                          text: '7000.0',
                          style: TextStyle(
                            fontSize: 47,
                            color: Colors.grey.withOpacity(0.5),
                            fontWeight: FontWeight.w300,
                          )
                      ),
                    ],
                  )
              ),
            ),
            Spacer(),

            Text('•••• •••• •••• 5040',
              style: textStyle.copyWith(
                wordSpacing: 10,
                letterSpacing: 6,
              ),
            )
          ],
        ),
      ),
    );
  }
}