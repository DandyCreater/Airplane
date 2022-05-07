import 'package:flutter/material.dart';
import 'package:splashscreen/Pages/PageDetails.dart';
import 'package:splashscreen/cubit/models/DestinationModel.dart';

import '../theme.dart';

class DestinationCards extends StatelessWidget {
  final DestinationModel destination;

  const DestinationCards(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PageDetails(destination)));
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 323,
              width: 200,
              margin: EdgeInsets.only(left: defaultMargin),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 220,
                    width: 180,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            image: NetworkImage(destination.imageUrl))),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 24,
                        width: 46,
                        decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(18))),
                        child: Container(
                          margin: EdgeInsets.only(left: 4, bottom: 1),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/img/icon_star.png'))),
                              ),
                              Text(
                                destination.rating.toString(),
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination.name,
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          destination.city,
                          style: greyTextStyle.copyWith(fontWeight: light),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
