import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class your_order extends StatefulWidget {
  const your_order({Key? key}) : super(key: key);

  @override
  State<your_order> createState() => _your_orderState();
}

class _your_orderState extends State<your_order> {
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
      body: Container(height: size.height,
        width: size.width,
        color: Color.fromRGBO(221,213,224,100),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(width: size.width/1,//size.height/8,
                height: size.height/10, //size.width/4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(7))
                ),

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 80,//size.height/8,
                          width: 80, //size.width/4,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Image.asset("assets/backlogin.png",)),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Printed Tshirt",style: TextStyle(color: Colors.deepPurple ,fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "status:  Process",style: TextStyle(color: Colors.grey ,fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "₹ 2300",style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Return Date:  02/04/23",style: TextStyle(color: Colors.grey ,fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(width: size.width/1,//size.height/8,
                height: size.height/10, //size.width/4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),

                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 80,//size.height/8,
                          width: 80, //size.width/4,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Image.asset("assets/backlogin.png",)),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Printed Tshirt",style: TextStyle(color: Colors.deepPurple ,fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "status:  Process",style: TextStyle(color: Colors.grey ,fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "₹ 2300",style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Return Date:  02/04/23",style: TextStyle(color: Colors.grey ,fontWeight: FontWeight.bold, fontSize: 10),
                          ),
                        ),
                      ],
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
