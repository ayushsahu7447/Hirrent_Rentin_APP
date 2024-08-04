import 'package:flutter/material.dart';
import 'package:hirrent/category/widgets/last_category_tile.dart';

class SubMainCategoryTile extends StatelessWidget {
  const SubMainCategoryTile();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(title: const Text(
      "Topwear",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18
      ),
    ),
      leading: Container(
        padding: EdgeInsets.only(
          top: 5, bottom: 7 , left: 20, right: 10),
        child: Image.asset(""),
      ),
      children: [
        LastCategorytile(),
        LastCategorytile(),
        LastCategorytile(),
      ],
    );
  }
}
