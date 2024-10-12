import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../comman/colors.dart';

class BitcoinNews extends StatelessWidget {
  const BitcoinNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
        width: width,
        height: width < 320
            ? 320
            : width < 530
            ? 280
            : width < 1201
            ? 250
            : width < 1275
            ? 350
            : 307,
        child: Carousel(
          images: [
            BitNews(context),
            BitNews(context),
            BitNews(context),
          ],
          dotSize: 5.0,
          dotSpacing: 15.0,
          dotColor: AppColor.dotscolor,
          indicatorBgPadding: 12.0,
          dotBgColor: Colors.transparent,
          borderRadius: true,
        ));
  }
}
Container BitNews(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  return Container(
    color: AppColor.selecteColor,
    // color: Colors.amber,
    child: Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          "assets/svg/bitcoin_news.svg",
          width: width,
          fit: BoxFit.fitWidth,
        ),
        Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                SvgPicture.asset(
                  "assets/svg/bitcoin.svg",
                ),
                SizedBox(height: 18),
                Text(
                  "Bitcoin News",
                  style: TextStyle(
                      color: AppColor.mainbackground,
                      fontSize: 21,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 11),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    "Bitcoin prices fell sharply amid the global sell-off in equities. Negative news over the Bitcoin past week has dampened Bitcoin basics entiment for bitcoin.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.mainbackground.withOpacity(.80),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: 103,
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppColor.boxborder,
                      borderRadius: BorderRadius.circular(3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "View details",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.dark,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 12,
                        color: AppColor.black,
                      )
                    ],
                  ),
                ),
              ],
            ))
      ],
    ),
  );
}



