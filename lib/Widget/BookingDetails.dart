import 'package:flutter/material.dart';

import '../theme.dart';

class BookingDetails extends StatelessWidget {
  final String title;
  final String details;
  final Color color;

  const BookingDetails(
      {Key? key,
      required this.title,
      required this.details,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 6),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/icon_check.png'))),
          ),
          Text(title, style: blackTextStyle),
          Spacer(),
          Text(
            details,
            style: blackTextStyle.copyWith(fontWeight: semiBold, color: color),
          ),
        ],
      ),
    );
  }
}
