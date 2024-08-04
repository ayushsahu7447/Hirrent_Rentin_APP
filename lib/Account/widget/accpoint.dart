import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class accpoint extends StatelessWidget {
  const accpoint({Key? key, required this.label, required this.icon1, required this.icon2}) : super(key: key);
  final String label;
  final String icon1;
  final String icon2;

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(icon1),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(icon2),
          ),
        ],
      ),
    );
  }
}
