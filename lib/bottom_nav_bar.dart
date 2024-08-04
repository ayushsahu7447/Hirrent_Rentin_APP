import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),Text(
      'Index 2: School',
      style: optionStyle,
    ),Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Container(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
              "assets/svg/home-line.svg",color: Colors.deepPurpleAccent,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 22,
            height: 22,
            child: SvgPicture.asset(
                "assets/svg/category.svg",color: Colors.deepPurpleAccent
            ),
          ),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
                "assets/svg/fav.svg",color: Colors.deepPurpleAccent
            ),
          ),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
                "assets/svg/Icon.svg",color: Colors.deepPurpleAccent
            ),
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 25,
            height: 25,
            child: SvgPicture.asset(
                "assets/svg/profile.svg",color: Colors.deepPurpleAccent
            ),
          ),
          label: 'Account',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  }
}