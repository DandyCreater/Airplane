import 'package:flutter/material.dart';
import 'package:splashscreen/Widget/CustomButton.dart';
import 'package:splashscreen/cubit/auth_cubit.dart';
import 'package:splashscreen/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget BonusCard() => BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Container(
                width: 300,
                height: 211,
                padding: EdgeInsets.all(defaultMargin),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/img/imagecard.png',
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: kPrimaryColor.withOpacity(0.5),
                        blurRadius: 50,
                        offset: Offset(0, 10),
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                style:
                                    whiteTextStyle.copyWith(fontWeight: light),
                              ),
                              Text(
                                '${state.user.name}',
                                style: whiteTextStyle.copyWith(
                                    fontWeight: medium, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 6),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/img/iconplane.png',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Pay',
                          style: whiteTextStyle.copyWith(
                              fontWeight: medium, fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 41,
                    ),
                    Text('Balance',
                        style: whiteTextStyle.copyWith(
                          fontWeight: light,
                        )),
                    Text('IDR 280.000.000',
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium, fontSize: 26)),
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          },
        );

    Widget Title() => Container(
          padding: EdgeInsets.only(top: 80),
          child: Text(
            'Big Bonus 🎉',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 32),
          ),
        );

    Widget SubTitle() => Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'We give you early credit so that \nyou can buy a flight ticket',
            style: greyTextStyle.copyWith(
              fontWeight: light,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        );

    Widget StartButton() => Container(
          child: CustomButtom(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            },
            title: 'Start Fly Now',
            margin: EdgeInsets.only(top: 50),
            width: 220,
          ),
        );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BonusCard(),
            Title(),
            SubTitle(),
            StartButton(),
          ],
        ),
      ),
    );
  }
}
