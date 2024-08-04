import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hirrent/bottom_nav_bar.dart';
import 'package:hirrent/ewidget/button.dart';
import 'package:hirrent/product/screen/product_single.dart';
import 'package:lottie/lottie.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
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
            child: Icon(Icons.circle_notifications_sharp, size: 25,color: Colors.black,),
          )
        ],
        title: Row(
          children: [
            Icon(Icons.shopping_bag_outlined, size: 20 ,color: Colors.black,),
            SizedBox(width: 7,),
            Text("Cart", style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 16),)
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomnavbar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Center(child: Lottie.asset("assets/lotties/71390-shopping-cart-loader.json", height: size.height/5)),

                  Center(child: Text("Cart Items that you like in your Cart, \nReview them anytime and easily move \nthem to bag", textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: submit(label: "Shop Now", width: size.width/12, onCountSelected: () {  },),
                  )
                ],
              ),
            ),
            Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(alignment: Alignment.centerLeft,child: Text("Recommend Product", style: TextStyle(color: Colors.black87 ,fontWeight: FontWeight.bold, fontSize: 16),)),
                )
            ),
            Container(
              height: size.height/2,
              width: size.width/1.05,
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
                      padding: EdgeInsets.all(8.0),
                      child: ProductDetailPage(),
                    ),Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ProductDetailPage(),
                    ),Padding(
                      padding: EdgeInsets.all(8.0),
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
