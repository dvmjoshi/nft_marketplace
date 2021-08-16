import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class BankApp extends StatefulWidget {
  @override
  _BankAppState createState() => _BankAppState();
}

class _BankAppState extends State<BankApp>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late final PageController _pageController = PageController();
  late Animation<double> _rotation;
  final cards = 4;

  bool _isCardDetailsOpened() => _controller.isCompleted;

  void _openCloseCard() {
    if(_controller.isCompleted) {
      _controller.reverse();
    } else if (_controller.isDismissed){
      _controller.forward();
    }
  }

  int _getCardIndex() {
    return _pageController.hasClients ? _pageController.page!.round() : 0;
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);

    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 320)
    );
    _rotation = Tween(
        begin: 0.0, end: 90.0
    ).animate(CurvedAnimation(parent: _controller,
        curve: Curves.linear
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double contentPadding = 32;

    return  Container(
      color: Colors.grey.shade900,
        height: 400,
        child: Stack(
          children: [
            Positioned(
              top: screenSize.height * .115,
              left: screenSize.width * .415,
              right: 0,
              height: 200,
              child: AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _controller.value > 0.5 ? 0 : 1,
                        child: SizedBox(
                          width: 100,
                          child: Row(
                            children: List.generate(cards, (i) {
                              final selected = _getCardIndex() == i;
                              return Container(
                                width: 6, height: 6,
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                  color: selected ? Colors.white : Colors.white30,
                                  shape: BoxShape.circle,
                                ),
                              );
                            }),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Positioned(
              top: 16,
              left: 0,
              right: 0,
              height: 200,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return PageView.builder(
                    itemCount: cards,
                    controller: _pageController,
                    clipBehavior: Clip.none,
                    physics: _isCardDetailsOpened()
                        ? NeverScrollableScrollPhysics()
                        : BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      if (_getCardIndex() != i) return _Card(onItemPressed: _openCloseCard,);
                      return Transform.rotate(
                        angle: _rotation.value * math.pi / 180,
                        alignment: Alignment.lerp(
                          Alignment.center,
                          Alignment(-.7, -.6),
                          _controller.value,
                        ),
                        child: _Card(onItemPressed: _openCloseCard,),
                      );
                    },
                  );
                },
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              child: _CardStats(
                onItemPressed: _openCloseCard,
              ),
              builder: (context, child) {
                return Positioned(
                  top: 60,
                  right: -180 + (280 * _controller.value),
                  child: Opacity(
                    opacity: _controller.value,
                    child: child,
                  ),
                );
              },
            ),

          ],
        ),
      );
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.deepPurple.shade900,
      //   child: Icon(Icons.add),
      //   onPressed: _openCloseCard,
      // ),

  }

  // LineChartData sampleData1() {
  //   return LineChartData(
  //     lineTouchData: LineTouchData(
  //       handleBuiltInTouches: true,
  //     ),
  //     titlesData: FlTitlesData(
  //       bottomTitles: SideTitles(
  //         showTitles: true,
  //         reservedSize: 22,
  //         getTextStyles: (value) => const TextStyle(
  //           color: Color(0xff72719b),
  //           fontWeight: FontWeight.bold,
  //           fontSize: 16,
  //         ),
  //         margin: 10,
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 2:
  //               return 'Jan';
  //             case 7:
  //               return 'Feb';
  //             case 12:
  //               return 'Mar';
  //           }
  //           return '';
  //         },
  //       ),
  //       leftTitles: SideTitles(
  //         showTitles: true,
  //         getTextStyles: (value) => const TextStyle(
  //           color: Color(0xff75729e),
  //           fontWeight: FontWeight.bold,
  //           fontSize: 14,
  //         ),
  //         getTitles: (value) {
  //           switch (value.toInt()) {
  //             case 1:
  //               return '';
  //             case 2:
  //               return '';
  //             case 3:
  //               return '';
  //             case 4:
  //               return '';
  //           }
  //           return '';
  //         },
  //         margin: 8,
  //         reservedSize: 30,
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //       show: true,
  //       border: const Border(
  //         bottom: BorderSide(
  //           color: Color(0xff4e4965),
  //           width: 4,
  //         ),
  //         left: BorderSide(
  //           color: Colors.transparent,
  //         ),
  //         right: BorderSide(
  //           color: Colors.transparent,
  //         ),
  //         top: BorderSide(
  //           color: Colors.transparent,
  //         ),
  //       ),
  //     ),
  //     minY: 0,
  //     lineBarsData: linesBarData1(),
  //   );
  // }
  //
  // List<LineChartBarData> linesBarData1() {
  //   final lineChartBarData1 = LineChartBarData(
  //     spots: [
  //       FlSpot(1, 1),
  //       FlSpot(3, 1.5),
  //       FlSpot(5, 1.4),
  //       FlSpot(7, 3.3),
  //       FlSpot(10, 2),
  //       FlSpot(12, 2.2),
  //       FlSpot(13, 1.8),
  //     ],
  //     isCurved: true,
  //     colors: [
  //       const Color(0xff4af699),
  //     ],
  //     barWidth: 8,
  //     isStrokeCapRound: true,
  //     dotData: FlDotData(
  //       show: false,
  //     ),
  //     belowBarData: BarAreaData(
  //       show: false,
  //     ),
  //   );
  //   final lineChartBarData2 = LineChartBarData(
  //     spots: [
  //       FlSpot(1, 1),
  //       FlSpot(3, 2.8),
  //       FlSpot(7, 1.2),
  //       FlSpot(10, 2.8),
  //       FlSpot(12, 2.6),
  //       FlSpot(13, 3.3),
  //     ],
  //     isCurved: true,
  //     colors: [const Color(0xFFae06cf)],
  //     barWidth: 8,
  //     isStrokeCapRound: true,
  //     dotData: FlDotData(
  //       show: false,
  //     ),
  //     belowBarData: BarAreaData(show: false, colors: [
  //       const Color(0x00aa4cfc),
  //     ]),
  //   );
  //   final lineChartBarData3 = LineChartBarData(
  //     spots: [
  //       FlSpot(1, 2.8),
  //       FlSpot(3, 1.9),
  //       FlSpot(6, 3),
  //       FlSpot(10, 1.3),
  //       FlSpot(13, 2.5),
  //     ],
  //     isCurved: true,
  //     colors: const [
  //       Color(0xff27b6fc),
  //     ],
  //     barWidth: 8,
  //     isStrokeCapRound: true,
  //     dotData: FlDotData(
  //       show: false,
  //     ),
  //     belowBarData: BarAreaData(
  //       show: false,
  //     ),
  //   );
  //   return [
  //     lineChartBarData1,
  //     lineChartBarData2,
  //     lineChartBarData3,
  //   ];
  // }
}

class _CardStats extends StatelessWidget {
  const _CardStats({Key? key, required this.onItemPressed}) : super(key: key);

  final VoidCallback onItemPressed;

  @override
  Widget build(BuildContext context) {
    final bodyText = Theme.of(context).textTheme.bodyText1!.copyWith(
      color: Colors.white60,
    );
    return Container(
      width: 180,
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            child: Image.asset("assets/payment.png"),
          ),
          Text.rich(TextSpan(
              text: '\$\t',
              style: bodyText.copyWith(fontSize: 24, color: Colors.white30),
              children: [TextSpan(text: '5,680',
                  style: bodyText.copyWith(fontSize: 32, color: Colors.white70)
              )]
          )),
          ListTile(
            onTap: onItemPressed,
            horizontalTitleGap: 0,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.payment, color: Colors.white30),
            title: Text('Bank Card', style: bodyText),
          ),
          ListTile(
            onTap: onItemPressed,
            horizontalTitleGap: 0,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.money, color: Colors.white30),
            title: Text('Bank Account', style: bodyText),
          ),
          ListTile(
            onTap: onItemPressed,
            horizontalTitleGap: 0,
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.rss_feed, color: Colors.white30),
            title: Text('Pay', style: bodyText),
          ),
        ],
      ),
    );
  }
}


class _Card extends StatelessWidget {
  const _Card({Key? key, required this.onItemPressed}) : super(key: key);

  final VoidCallback onItemPressed;
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
      color: Colors.white70,
    );

    return InkWell(
      onTap: onItemPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * .85,
        height: 190,
        padding: EdgeInsets.all(32),
        margin: EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade900,
            borderRadius: BorderRadius.circular(32),
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
                    Text('Nft'.toUpperCase(), style: textStyle),
                    SizedBox(height: 6),
                    Text('Platinum'.toUpperCase(), style: textStyle),
                  ],
                ),

                Container(
                  height: 80,
                  child: Image.asset("assets/wallet.png"),
                )
              ],
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
