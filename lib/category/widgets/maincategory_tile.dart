import 'package:flutter/material.dart';
import 'package:hirrent/category/widgets/sub_main_category.dart';

class MainCategoryTile extends StatelessWidget {
  final Color colour;
  final String text;
  final String description;
  final String image;
  const MainCategoryTile({Key? key, required this.colour, required this.text, required this.description, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: colour,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(text, style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),),
                    Icon(Icons.arrow_drop_down,size: 35,color: Colors.white,)

                  ],
                ),
                Text(description,style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis
                ),)
              ],
            ),
          ),
          SizedBox(
            width: 18,
          ),
          Image.asset(image)
        ],
      ),
    ),
      trailing: SizedBox.shrink(),
      children: [
        SubMainCategoryTile(),
        SubMainCategoryTile(),
      ],
    );
  }
}
