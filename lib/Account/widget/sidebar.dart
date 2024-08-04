import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 10);
  @override
  Widget build(BuildContext context) {



    return Drawer(
      child: Material(
        color: Colors.deepOrange,
        child: ListView(
          children: <Widget>[
            buildHeader(name: "name", position: "position", onClicked: () {}),
            Container(
              padding: padding,
              child: Column(
                children: [
                  Divider(color: Colors.white),
                  Divider(color: Colors.white),
                  const SizedBox(height: 2),
                  buildMenuItem(
                    text: 'My Order',
                    icon: Icons.shopping_bag_outlined,
                    onClicked: () => {
                      },
                  ),
                  const SizedBox(height: 2),
                  buildMenuItem(
                    text: 'My Cart',
                    icon: Icons.shopping_cart_outlined,
                    onClicked: () => {},
                  ),
                  const SizedBox(height: 2),
                  buildMenuItem(
                    text: 'Wishlist',
                    icon: Icons.favorite_border,
                    //onClicked: () => {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Farmer_Bank_details()))},
                    onClicked: () => {},
                  ),
                  const SizedBox(height: 2),
                  buildMenuItem(
                    text: 'My Account',
                    icon: Icons.person,
                    //onClicked: () => {Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Farmer_crop_info()))},
                    onClicked: () => {},
                  ),
                  const SizedBox(height: 2),
                  buildMenuItem(
                    text: 'Contact Us',
                    icon: Icons.book_online_outlined,
                    onClicked: () => {}),
                  const SizedBox(height: 2),
                  buildMenuItem(
                    text: 'Rate this App',
                    icon: Icons.rate_review_outlined,
                    onClicked: () => {},
                  ),
                  const SizedBox(height: 2),
                  buildMenuItem(
                    text: 'Term and Condition',
                    icon: Icons.note_alt_outlined,
                    onClicked: () => {},
                  ),
                  const SizedBox(height: 2),
                  buildMenuItem(
                    text: 'Return Policy',
                    icon: Icons.assignment_return,
                    onClicked: () => {},
                  ),
                  const SizedBox(height: 2),
                  buildMenuItem(
                    text: 'Share',
                    icon: Icons.share,
                    onClicked: () => {},
                  ),
                  const SizedBox(height: 2),
                  buildMenuItem(
                    text: 'Share with us',
                    icon: Icons.waving_hand,
                    onClicked: () => {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String name,
    required String position,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 20)),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: SizedBox(
                    width: 60,
                    height: 60,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/Bung.png",
                      ),
                    )),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    position,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color, fontSize: 17)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
