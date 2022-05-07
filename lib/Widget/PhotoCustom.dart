import 'package:flutter/material.dart';

class PhotoCustom extends StatelessWidget {
  final String ImageUrl;
  const PhotoCustom({Key? key, required this.ImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(ImageUrl))),
    );
  }
}
