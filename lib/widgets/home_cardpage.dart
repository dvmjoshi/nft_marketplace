
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:nft_marketplace/utils/colors.dart';
import 'package:nft_marketplace/widgets/button_plain.dart';

class ShoppingCardPager extends StatefulWidget {
  const ShoppingCardPager({Key? key}) : super(key: key);

  @override
  _ShoppingCardPagerState createState() => _ShoppingCardPagerState();
}

class _ShoppingCardPagerState extends State<ShoppingCardPager> with SingleTickerProviderStateMixin{
  late PageController _pageController=PageController(initialPage: currentPageValue);
  late AnimationController animationController;
  late Animation      animation;
  int photoindex=0;

  int currentPageValue = 0;
  int previousPageValue = 0;
  double _moveBar = 0.0;
  final List<Widget> _cards = [
   const ShoppingCardPagerItem(
      categoryBig: CategoryBig(
          bgColor: lightening_yellow,
          startColor: lightening_yellow,
          name: "Tree \nof knowing",
          image: "https://cdn.dribbble.com/users/518045/screenshots/11110738/media/0621dc7bcd342843ae4bb0e3edb8f40a.png?compress=1&resize=800x600"),
    ),
    const ShoppingCardPagerItem(
      categoryBig: CategoryBig(
          bgColor: lightening_yellow,
          startColor: lightening_yellow,
          name: "Summer \nCollection",
          image: "https://cdn.dribbble.com/users/15687/screenshots/15964521/media/48a340f7e09af0a5e69dec80c540cdd6.png?compress=1&resize=1600x1200"),
    ),
    const ShoppingCardPagerItem(
      categoryBig: CategoryBig(
          bgColor: lightening_yellow,
          startColor: lightening_yellow,
          name: "Bitcoin \nCollection",
          image: "https://cdn.dribbble.com/users/720738/screenshots/6678628/spot_zidler_dribbble_lance_pierre.gif"),
    ),
    const ShoppingCardPagerItem(
      categoryBig: CategoryBig(
          bgColor: lightening_yellow,
          startColor: lightening_yellow,
          name: "Tee \ntrump",
          image: "https://cdn.dribbble.com/users/31664/screenshots/9524209/media/5a169ecbbfc9a1b0c06d8c395552dc8f.gif"),
    ),
    const ShoppingCardPagerItem(
      categoryBig: CategoryBig(
          bgColor: lightening_yellow,
          startColor: lightening_yellow,
          name: "Huhu \nMask",
          image: "https://cdn.dribbble.com/users/15687/screenshots/10953972/media/eace818c852528e3745c16fa6b7e1c7d.png?compress=1&resize=1600x1200"),
    )
  ];

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentPageValue < _cards.length) {
        currentPageValue++;
      } else {
        currentPageValue = 0;
      }

      _pageController.animateToPage(
        currentPageValue,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeInSine,
      );
    });
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 180,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: PageView.builder(
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return _cards[index];
            },
            onPageChanged: (int page) {
              animatePage(page);
            },
            itemCount: _cards.length,
            controller: _pageController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0,right: 24,top: 24,bottom: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < _cards.length; i++)
                if (i == currentPageValue) ...[
                  const CircleDotWidget(
                    isActive: true,
                    color: flamingo,
                    borderColor: flamingo,
                  )
                ] else
                  const CircleDotWidget(
                    isActive: false,
                    color: white,
                    borderColor: wood_smoke,
                  ),
            ],
          ),
        ),
      ],
    );
  }

  void animatePage(int page) {
    print('page is $page');

    currentPageValue = page;

    if (previousPageValue == 0) {
      previousPageValue = currentPageValue;
      _moveBar = _moveBar + 0.14;
    } else {
      if (previousPageValue < currentPageValue) {
        previousPageValue = currentPageValue;
        _moveBar = _moveBar + 0.14;
      } else {
        previousPageValue = currentPageValue;
        _moveBar = _moveBar - 0.14;
      }
    }

    setState(() {

    });
  }
}
class ShoppingCardPagerItem extends StatelessWidget {
  final CategoryBig? categoryBig;

  const ShoppingCardPagerItem({this.categoryBig});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: ShapeDecoration(
        //  color: categoryBig!.bgColor,
          image: DecorationImage(
            image: NetworkImage(categoryBig!.image),
            fit: BoxFit.cover
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              side: BorderSide(color: wood_smoke, width: 2))),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 24),
                  child: Text(
                    categoryBig!.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: wood_smoke,
                        fontSize: 22,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, bottom: 24),
                  child: ButtonPlain(
                    color: wood_smoke,
                    borderColor: wood_smoke,
                    textColor: white,
                    text: "Buy now",
                    size: 96,
                    onTap: () {
                      Navigator.pushNamed(context, "/collection");
                    },
                  ),
                )
              ],
            ),
          ),
          // Expanded(
          //   flex: 4,
          //   child: SvgPicture.asset(
          //     categoryBig.image,
          //     width: 210,
          //     height: 230,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final Color? bgColor;
  final Color startColor;

  const Category({required this.name, required this.startColor, this.bgColor});
}

class CategoryBig {
  final String name;
  final String image;
  final Color bgColor;
  final Color startColor;

  const CategoryBig({required this.name, required this.image, required this.startColor, required this.bgColor});
}


class CircleDotWidget extends StatelessWidget {
  final bool isActive;
  final Color color;
  final Color borderColor;

  const CircleDotWidget({required this.isActive, required this.color, required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 14 : 10,
      width: isActive ? 14 : 10,
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: borderColor),
          color: color,
          shape: BoxShape.circle),
    );
  }
}
