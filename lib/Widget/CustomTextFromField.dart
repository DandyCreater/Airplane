import 'package:flutter/material.dart';

import '../theme.dart';

class CustomTextFromField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;
  const CustomTextFromField(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controller,
      this.obsecureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title),
        SizedBox(
          height: 6,
        ),
        TextFormField(
            controller: controller,
            obscureText: obsecureText,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: Colors.purple, width: 1)))),
      ]),
    );
  }
}
