import 'package:flutter/material.dart';
import 'package:splashscreen/Widget/CustomButton.dart';
import 'package:splashscreen/cubit/page_cubit.dart';
import 'package:splashscreen/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 300,
              margin: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/image_success.png'))),
            ),
            Text(
              'Well Booked 😍',
              style:
                  blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Are you ready to explore the new\nworld of experiences?',
              style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            CustomButtom(
              title: 'My Bookings',
              onPressed: () {
                context.read<PageCubit>().SetPage(1);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
              margin: EdgeInsets.only(top: 50),
              width: 220,
            ),
          ],
        ),
      ),
    );
  }
}
