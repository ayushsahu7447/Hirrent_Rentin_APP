import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hirrent/home/widget/banner.dart';
import 'package:hirrent/home/widget/crousel.dart';
import 'package:hirrent/home/widget/listban2.dart';
import 'package:hirrent/home/widget/marquee.dart';
import 'package:hirrent/home/widget/timer.dart';
import 'package:hirrent/product/screen/product_single.dart';
import '../widget/listbanner.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(221,213,224,100),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.density_medium_outlined,
          color: Colors.deepPurple,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/offer.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/svg/notify.svg",
              color: Colors.black,
              height: 22,
              width: 22,
            ),
          ),
        ],
        title: Row(
          children: [
            Image.asset("assets/single_logo.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/logo2.png"),
            ),
          ],
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 8, top: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search ....',
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ),
            )),
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Column(
          children: [
            BannerCard(
              imageUrl: '',
              heigh: size.height / 2.7,
            ),
            ShoppingMarquee(),
            lowban(),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10,right: 10 ,top: 0),
                    child: Image.asset("assets/logo.png" , height: 100,width: 100,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/rectangle.png"),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Men",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/rectangle.png"),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Men",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ImageCarousel(
              heigh: size.height / 4,
              padding: 10,
              fracpoint: 1,
            ),
            Container(
              child: ProductTimer(
                endTime: DateTime(2023, 4, 10, 2, 30),
              ),
            ),
            BannerCard(
              imageUrl: '',
              heigh: size.height / 12,
            ),
            BannerCard(
              imageUrl: '',
              heigh: size.height / 3,
            ),
            BannerCard(
              imageUrl: '',
              heigh: size.height / 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  BannerCard(
                    imageUrl: '',
                    heigh: size.height / 4,
                  ),
                  low2ban()

                ],
              ),
            ),
            BannerCard(
              imageUrl: '',
              heigh: size.height / 12,
            ),
            Container(
              height: size.height/2,
              width: size.width/1.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductDetailPage(),
                    ),Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductDetailPage(),
                    ),Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductDetailPage(),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
