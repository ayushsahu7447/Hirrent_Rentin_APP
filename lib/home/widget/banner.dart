import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerCard extends StatelessWidget {
  final String imageUrl;
  final double heigh;
  const BannerCard({Key? key,
    required this.imageUrl, required this.heigh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        child: CachedNetworkImage(
          imageUrl: 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey.shade300,
                child: Container(

                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(0))
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(0)),
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
          fit: BoxFit.cover,
          width: double.infinity,
          height: heigh,
        ),
      ),
    );
  }
}