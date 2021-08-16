import 'package:flutter/material.dart';
import 'package:nft_marketplace/screens/balance.dart';


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(milliseconds: 1500),
                  builder: (context,value, child) {
                    var v;
                    if(value!=null){
                    v=value;

                    }
                    return ShaderMask(
                        shaderCallback: (rect) {
                          return RadialGradient(
                              radius:v*5 , colors: [Colors.white, Colors.white, Colors.transparent, Colors.transparent], stops: [0.0, 0.55, 0.6, 1.0],
                              center: FractionalOffset(0.95, 0.0))
                              .createShader(rect);
                        },
                        child: PageContent());
                  }),
            );
          },
        ));
  }
}

final data = [
  {"banner": "apex_banner", "title": "Youtube", "message": "Welcome to Youtube"},
  {"banner": "destiny_banner", "title": "Stadia", "message": "Stadia Community Forums"},
  {"banner": "pubg_banner", "title": "Youtube", "message": "PUBG Events"}
];


class PageContent extends StatefulWidget {
  const PageContent({Key? key}) : super(key: key);

  @override
  _PageContentState createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  List numberAsList = [];

  String money = '20';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
         appBar:  AppBar(
           leading: IconButton(
               onPressed: (){
                 Navigator.of(context).pop();
               },
               icon: Icon(Icons.arrow_back)
           ),
           elevation: 0,
           title: Text("Profile"),
           backgroundColor: Colors.grey.shade900,
         ),
      body: body(),
    );
  }




  Widget body(){
    return Column(
      children: [
        BankApp(),
        moneyWidget(),
        keypadWidget(),
       // button(),
      ],
    );
  }

  Widget userTile(){
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage("sadb"),
      ),
      title: Txt(
        text: "Jane Foster",
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      subtitle: cardWithNumber(),
      trailing: IconButton(
          icon: Icon(Icons.arrow_forward_ios,color: Colors.white, size: 18),
          onPressed: (){

          }
      ),
    );
  }


  Widget cardWithNumber(){
    return Row(
      children: [
        Icon(Icons.credit_card, color: Colors.grey,size:18),
        Txt(
            text: " **** 5064",
            //  text: "98765432105064".replaceRange(0,10," **** "),
            color: Colors.grey
        ),
      ],
    );
    // return RichText( this alignment is not satisfying
    //   text: TextSpan(
    //     children: [
    //       WidgetSpan(
    //         child: Icon(Icons.credit_card, color: Colors.grey),
    //       ),
    //       TextSpan(
    //         text: "98765432105064".replaceRange(0,10,"****"),
    //       ),
    //     ]
    //   ),
    // );
  }


  Widget moneyWidget(){
    return
      Padding(
      padding: const EdgeInsets.symmetric(vertical:2),
      child: RichText(
//$
          text: TextSpan(
            text: '\$',
            style: TextStyle(
              fontSize: 60,
              color: Colors.grey.withOpacity(0.5),
              fontWeight: FontWeight.w300,
            ),
            children: [
//20
              TextSpan(
                text: money,
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
//.0
              if(money!='') TextSpan(
                  text: '.0',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w300,
                  )
              ),
            ],
          )
      ),
    );
  }



  Widget keypadWidget(){
    return Flexible(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: numbers.length,
        itemBuilder: (BuildContext context, int index) {
          int number = numbers[index];
          if(index==9) return Container(height:0,width:0);
          return InkWell(
            borderRadius: BorderRadius.circular(360),
            onTap: (){
              if(index==11){
                try {

                  setState(()=>money = money.replaceRange(money.length-1, money.length,''));
                } catch (e) {
                  print("Error removing $e");
                }
              }else{
                setState(()=>money = '$money$number');
              }
            },
            child: Container(
              child: index==11? Icon(Icons.backspace,color: Colors.grey):
              Txt(
                text: number,
                color: Colors.white,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black38,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget button(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:60,vertical:100),
      child: Container(
        height: 55,
        width: double.maxFinite,
        alignment: Alignment.center,
        child: const Txt(
          text: "Transfer to Jane",
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
          color: Colorz.sendMoneyBlue,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }


  static List<int> numbers = [1,2,3,4,5,6,7,8,9,-1,0,-1];
}

class Txt extends StatefulWidget {
  final FontStyle ? fontStyle;
  final FontWeight? fontWeight;
  final int ?maxlines;
  final double? fontSize;
  final Color ?color;
  final TextAlign? textAlign;
  final bool ?useoverflow;
  final bool ?upperCaseFirst;
  final bool? useQuotes;
  final bool ?useFiler;
  final bool ?underlined;
  final bool ?fullUpperCase;
  final bool ?fullLowerCase;
  final dynamic  text;
  final String ?fontFamily;

  const Txt({
    Key? key,
    this.fontStyle,
    this.fontWeight,
    this.maxlines,
    this.fontSize,
    this.color,
    this.textAlign,
    this.useoverflow = false,
    this.upperCaseFirst = false,
    this.useQuotes = false,
    this.useFiler = false,
    this.underlined = false,
    this.fullUpperCase = false,
    this.fullLowerCase = false,
    @required this.text,
    this.fontFamily,
  }) : super(key: key);

  @override
  _TxtState createState() => _TxtState();
}

class _TxtState extends State<Txt> {
  String finalText = "Null";

  @override
  Widget build(BuildContext context) {
    bool isString = widget.text is String;
    bool isNumber = widget.text is double || widget.text is int;
    bool isOthers = isString==false && isNumber==false;

    if (isString)  finalText = widget.text ?? "Error";//when you forgot to set a value, "Error" will be shown
    if (isNumber) finalText = '${widget.text}';
    if (isOthers)  finalText = "Invalid input ${widget.text}";




//John → john
    if(widget.fullLowerCase!) finalText = finalText.toLowerCase();

//John → JOHN
    if (widget.fullUpperCase!) finalText = finalText.toUpperCase();


//JOHN or john → John
    if (widget.upperCaseFirst! && finalText.length > 1)  finalText = "${finalText[0].toUpperCase()}${finalText.substring(1, finalText.length).toLowerCase()}";

//John → "John"
    if (widget.useQuotes!) finalText = "❝$finalText❞";

//John*_-#![] → John
    if (widget.useFiler!) finalText = finalText.replaceAll("*", "").replaceAll("_", "").replaceAll("-", "").replaceAll("#", "").replaceAll("\n", "").replaceAll("!", "").replaceAll('[', '').replaceAll(']', '');


    return Text((finalText).toString(),
        overflow: widget.useoverflow! ? TextOverflow.ellipsis : null,
        textAlign: widget.textAlign,
        maxLines: widget.maxlines,
        textScaleFactor: 1,// This will keep your text size constant, when the user changes his device text size,
        style: TextStyle(
          decoration: widget.underlined! ? TextDecoration.underline : null,//to underlined a text
          color: widget.color,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          fontStyle: widget.fontStyle,
          fontFamily: widget.fontFamily,
        ));
  }
}
class Colorz {

  static const Color timerBlue = Color(0xff1c77dd);

  static const Color backgroundBlue = Color(0xff1b81f1);

  static const Color accountPurple = Color(0xff5b60ec);

  static const Color currenciesPageBackground = Color(0xff0f1e4e);
  static const Color currenciesNameColor = Color(0xff7080b3);
  static const Color currencyPositiveGreen = Color(0xff0eff7e);
  static const Color currencyIndicatorColor = Color(0xff6170f3);

  static const Color sendMoneyBlue = Color(0xff4285f4);

  static const Color googlResultsGrey = Color(0xffeff4f2);


  // static const Color compexDrawerScaffoldColor = Color(0xfe3e9f7);
  static const Color compexDrawerCanvasColor = Color(0xffe3e9f7);
  static const Color complexDrawerBlack = Color(0xff11111d);
  static const Color complexDrawerBlueGrey = Color(0xff1d1b31);



  //interlaced dashboard
  static const Color interlacedBackground = Color(0xfff7f8fa);
  static const Color interlacedAvatarBorderBlue = Color(0xff2554fc);
  static const Color interlacedChatPurple = Color(0xff8532fb);


  //richCalculator
  static const Color richCalculatorCanvas = Color(0xff222433);
  static const Color richCalculatorOutterButtonColor = Color(0xff333549);
  static const Color richCalculatorInnerButtonColor = Color(0xff2c2e41);
  static const Color richCalculatorYellowButtonColor = Color(0xffffba001);


  //buttonExample
  static const Color buttonExampleCanvas = Color(0xfff3f6ff);
  static const Color buttonSampleColor = Color(0xff7c2ae8);

}