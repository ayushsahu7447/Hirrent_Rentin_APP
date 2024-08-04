import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../home/widget/banner.dart';
import '../../home/widget/crousel.dart';
import '../../home/widget/double_banner.dart';

class funnel extends StatefulWidget {
  const funnel({Key? key}) : super(key: key);

  @override
  State<funnel> createState() => _funnelState();
}

class _funnelState extends State<funnel> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios_outlined , size: 20,color: Colors.black,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/svg/search.svg",color: Colors.black , height: 25,width: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/svg/Icon.svg",color: Colors.black , height: 22,width: 22,
            ),
          )
        ],
        title: Row(
          children: [
            Text("Your Order", style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 16),)
          ],
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              BannerCard(imageUrl: "http://en.wikipedia.org/wiki/PNG#/media/File:PNG_transparency_demonstration_1.png", heigh: size.height/4,),
              BannerCard(imageUrl: "http://en.wikipedia.org/wiki/PNG#/media/File:PNG_transparency_demonstration_1.png", heigh: size.height/8,),
              BannerCard(imageUrl: "http://en.wikipedia.org/wiki/PNG#/media/File:PNG_transparency_demonstration_1.png", heigh: size.height/4,),
              ImageCarousel(heigh:size.height/4, fracpoint: 0.8, padding: 5,),
              DoubleBanner(imageUrl1: '', heigh: size.height/4, imageUrl2: '',)
            ],
          ),
        ),
      ),

    );
  }
}
