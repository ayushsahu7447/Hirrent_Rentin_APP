import 'package:flutter/material.dart';

class LastCategorytile extends StatelessWidget {
  const LastCategorytile();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: 90 , top: 15 , bottom: 10 , right: 15
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "T-Shirt",
              style: TextStyle(
                fontSize: 15
              ),
            ),
            Divider(
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
