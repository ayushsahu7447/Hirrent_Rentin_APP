import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/maincategory_tile.dart';

class category extends StatelessWidget {
  const category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios_outlined , size: 20,color: Colors.black,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/svg/Icon.svg",color: Colors.black , height: 22,width: 22,
            ),
          )
        ],
        title: Row(
          children: [
            Text("Categories", style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 16),)
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            MainCategoryTile(colour: Colors.red,text: "Men",description: "Kurtas Tshirt Brand",image: "assets/backlogin.png",),
            MainCategoryTile(colour: Colors.teal,text: "Women",description: "Top Sarees Pants" ,image: "assets/backlogin.png",),
            MainCategoryTile(colour: Colors.amber,text: "Child",description: "Shorts , lower , Tshirt ",image: "assets/backlogin.png",),
            MainCategoryTile(colour: Colors.deepPurple,text: "Boys",description: "Stylish , Coloured",image: "assets/backlogin.png",),
            MainCategoryTile(colour: Colors.red,text: "Men",description: "Kurtas Tshirt Brand",image: "assets/backlogin.png",),
            MainCategoryTile(colour: Colors.teal,text: "Women",description: "Top Sarees Pants" ,image: "assets/backlogin.png",),
            MainCategoryTile(colour: Colors.amber,text: "Child",description: "Shorts , lower , Tshirt ",image: "assets/backlogin.png",),
          ],
        ),
      ),
    );
  }
}
