import 'package:flutter/material.dart';
import 'package:splashscreen/Widget/CustomButton.dart';
import 'package:splashscreen/theme.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/wallpaper.png'))),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like A Bird',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Explore New World With Us \nyourself get and amazing experiences',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                CustomButtom(
                  title: 'Get Started ',
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  width: 220,
                  margin: EdgeInsets.only(top: 50, bottom: 80),
                )

                // Container(
                //   margin: EdgeInsets.only(top: 50, bottom: 80),
                //   height: 55,
                //   width: 220,
                //   child: TextButton(
                //     style: TextButton.styleFrom(
                //         backgroundColor: kPrimaryColor,
                //         shape: RoundedRectangleBorder(
                //             borderRadius:
                //                 BorderRadius.circular(defaultRadius))),
                //     // onPressed: () {
                //     //   Navigator.pushNamed(context, '/signup');
                //     // },
                //     onPressed: () {
                //       Navigator.pushNamed(context, '/bonus');
                //     },
                //     child: Text(
                //       'Get Started',
                //       style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.w500,
                //           color: Colors.white),
                //     ),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
