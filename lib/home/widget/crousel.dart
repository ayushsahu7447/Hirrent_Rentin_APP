import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class ImageCarousel extends StatefulWidget {
  final double heigh;
  final double padding;
  final double fracpoint;

  ImageCarousel({required this.heigh, required this.padding, required this.fracpoint});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {


  final List<String> imageUrls = [
      'https://png.pngtree.com/png-clipart/20190920/original/pngtree-pink-skirt-summer-clothing-png-image_4643362.jpg',
      'https://png.pngtree.com/png-clipart/20190920/original/pngtree-pink-skirt-summer-clothing-png-image_4643362.jpg',
      'https://png.pngtree.com/png-clipart/20190920/original/pngtree-pink-skirt-summer-clothing-png-image_4643362.jpg',
    ''
    ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: widget.heigh,
        aspectRatio:16/9 ,
        viewportFraction: widget.fracpoint,
        enlargeCenterPage: false,
        autoPlay: true,
      ),
      items: imageUrls.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.all(widget.padding),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(2),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
