
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft_marketplace/model/nft_model.dart';
import 'package:nft_marketplace/utils/colors.dart';
import 'package:nft_marketplace/utils/hexcolor.dart';
import 'package:nft_marketplace/widgets/button_around.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: <Widget>[

                        Container(
                          height: 500,
                          width: MediaQuery.of(context).size.width,
                          color: flamingo,
                          child: Image.network(
                            "https://cdn.dribbble.com/users/43342/screenshots/10243567/media/ff3a06275f8af0e42fd629973dbda8e1.jpg?compress=1&resize=1600x1200",
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 110,
                      color: HexColor("#3A244E"),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "  Universe \n Collection",
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                    padding: EdgeInsets.all(24),
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      childAspectRatio: (1 / 1.7),
                    ),
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: nftList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ShopGridItemWidget(
                        nftModel: nftList[index],
                        onTap: () {
                          Navigator.pushNamed(
                              context, "/shopping_detail_page_one");
                        },
                      );
                    }),
              ],
            ),
          ),
          Positioned(
            left: 24,
            top: kToolbarHeight + statusBarHeight-40,
            child: ButtonRoundWithShadow(
                size: 48,
                borderColor: wood_smoke,
                color: white.withOpacity(0.8),
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
class ShopGridItemWidget extends StatelessWidget {
  final NftModel nftModel;
  final VoidCallback onTap;

  const ShopGridItemWidget({required this.nftModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 170,
            decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(nftModel.nftImage),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    side: BorderSide(color: Colors.white, width: 2))),

          ),
          SizedBox(
            height: 2,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              nftModel.nftName,
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color:Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Eth ${nftModel.price}",
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}