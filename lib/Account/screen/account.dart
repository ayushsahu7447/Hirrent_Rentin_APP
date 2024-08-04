import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hirrent/Account/widget/accpoint.dart';

import '../../ewidget/button.dart';

class account_screen extends StatefulWidget {
  const account_screen({Key? key}) : super(key: key);

  @override
  State<account_screen> createState() => _account_screenState();
}

class _account_screenState extends State<account_screen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color:  Color.fromRGBO(221,213,224,100),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: size.height/12,),
              Container(
                height: size.height/8,
                width: size.width/1.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/logo.png"),
                    ),
                    Spacer(),
                    submit(label: "Login/Join", width: size.width/12, onCountSelected: () {  },)
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(height: size.height/30,),
                  Container(
                    height: size.height/3.2,
                    width: size.width/1.1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          accpoint(icon1: "assets/svg/profile.svg", label: "Profile", icon2: "assets/svg/arow.svg",),
                          accpoint(icon1: "assets/svg/order.svg", label: "My Orders", icon2: "assets/svg/arow.svg",),
                          accpoint(icon1: "assets/svg/loc.svg", label: "Delivery Address", icon2: "assets/svg/arow.svg",),
                          accpoint(icon1: "assets/svg/wallet.svg", label: "Wallet", icon2: "assets/svg/arow.svg",),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height/30,),
                  Container(
                    height: size.height/3.2,
                    width: size.width/1.1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          accpoint(icon1: "assets/svg/about.svg", label: "About Us", icon2: "assets/svg/arow.svg",),
                          accpoint(icon1: "assets/svg/help.svg", label: "FAQ", icon2: "assets/svg/arow.svg",),
                          accpoint(icon1: "assets/svg/share.svg", label: "Share App", icon2: "assets/svg/arow.svg",),
                          accpoint(icon1: "assets/svg/wallet.svg", label: "Rate Us", icon2: "assets/svg/arow.svg",),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height/30,),
                  Container(
                    height: size.height/5.2,
                    width: size.width/1.1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          accpoint(icon1: "assets/svg/setting.svg", label: "Setting", icon2: "assets/svg/arow.svg",),
                          accpoint(icon1: "assets/svg/help.svg", label: "Become a Vendor", icon2: "assets/svg/arow.svg",),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height/30,),
                  Container(
                    height: size.height/10,
                    width: size.width/1.1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          accpoint(icon1: "assets/svg/logout.svg", label: "Logout", icon2: "assets/svg/arow.svg",),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height/30,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
