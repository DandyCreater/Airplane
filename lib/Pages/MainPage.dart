import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splashscreen/Pages/HomePage.dart';
import 'package:splashscreen/Pages/SettingPage.dart';
import 'package:splashscreen/Pages/TransaksiPage.dart';
import 'package:splashscreen/Widget/BottomNavigationItem.dart';
import 'package:splashscreen/cubit/page_cubit.dart';
import 'package:splashscreen/theme.dart';

import 'WalletPage.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget CustomBottomNavBar() => Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: EdgeInsets.only(
                left: defaultMargin, right: defaultMargin, bottom: 30),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: kWhiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavigationItemBar(
                  index: 0,
                  imageUrl: 'assets/img/icon_home.png',
                ),
                BottomNavigationItemBar(
                  index: 1,
                  imageUrl: 'assets/img/icon_booking.png',
                ),
                BottomNavigationItemBar(
                  index: 2,
                  imageUrl: 'assets/img/icon_card.png',
                ),
                BottomNavigationItemBar(
                  index: 3,
                  imageUrl: 'assets/img/icon_settings.png',
                ),
              ],
            ),
          ),
        );

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              CustomBottomNavBar(),
            ],
          ),
        );
      },
    );
  }
}
