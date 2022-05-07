import 'package:flutter/material.dart';

import '../theme.dart';

class SeatStatusItem extends StatelessWidget {
  final String ImageUrl;
  final String text;
  const SeatStatusItem({Key? key, required this.ImageUrl, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 16,
          width: 16,
          margin: EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImageUrl))),
        ),
        Text(
          text,
          style: blackTextStyle,
        ),
      ],
    );
  }
}
