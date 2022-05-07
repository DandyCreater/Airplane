import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splashscreen/Pages/ChooseSeatPage.dart';

import 'package:splashscreen/Widget/CustomButton.dart';
import 'package:splashscreen/Widget/InterestItem.dart';
import 'package:splashscreen/Widget/PhotoCustom.dart';
import 'package:splashscreen/cubit/models/DestinationModel.dart';
import 'package:splashscreen/theme.dart';

class PageDetails extends StatelessWidget {
  final DestinationModel destination;

  const PageDetails(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget BackgroundImage() => Container(
          height: 450,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(destination.imageUrl))),
        );

    Widget CustomShadow() => Container(
          height: 214,
          width: double.infinity,
          margin: EdgeInsets.only(top: 236),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                kWhiteColor.withOpacity(0),
                Colors.black.withOpacity(0.95)
              ])),
        );

    Widget Content() => Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            Container(
              height: 24,
              width: 108,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/icon_emblem.png'))),
            ),
            Container(
              margin: EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: whiteTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          destination.city,
                          style: whiteTextStyle.copyWith(
                              fontSize: 16, fontWeight: light),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 2),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/img/icon_star.png'))),
                      ),
                      Text(
                        destination.rating.toString(),
                        style: whiteTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: blackTextStyle.copyWith(height: 2),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Photos',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          PhotoCustom(
                            ImageUrl: 'assets/img/image_photo1.png',
                          ),
                          PhotoCustom(
                            ImageUrl: 'assets/img/image_photo2.png',
                          ),
                          PhotoCustom(
                            ImageUrl: 'assets/img/image_photo3.png',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Interest',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          InterestItem(text: 'Kids Park'),
                          InterestItem(text: 'Honor Bridge'),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          InterestItem(text: 'City Museum'),
                          InterestItem(text: 'Central Mall'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(destination.price),
                            style: blackTextStyle.copyWith(
                                fontSize: 18, fontWeight: medium)),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'per orang',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        )
                      ],
                    ),
                  ),
                  CustomButtom(
                    title: 'Book Now',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseSeat(destination)));
                    },
                    // onPressed: () {
                    //   Navigator.pushNamed(context, '/seat');
                    // },
                    width: 170,
                  )
                ],
              ),
            )
          ],
        ));

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BackgroundImage(),
            CustomShadow(),
            Content(),
          ],
        ),
      ),
    );
  }
}
