import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splashscreen/GetStarted/get_started.dart';
import 'package:splashscreen/Pages/CheckoutPage.dart';
import 'package:splashscreen/Pages/ChooseSeatPage.dart';
import 'package:splashscreen/Pages/MainPage.dart';
import 'package:splashscreen/Pages/PageDetails.dart';
import 'package:splashscreen/Signup/SigninPage.dart';
import 'package:splashscreen/Signup/SignupPage.dart';
import 'package:splashscreen/SplashScreen/splashscreen.dart';
import 'package:splashscreen/cubit/auth_cubit.dart';
import 'package:splashscreen/cubit/destination_cubit.dart';
import 'package:splashscreen/cubit/page_cubit.dart';
import 'package:splashscreen/cubit/seat_cubit.dart';
import 'package:splashscreen/cubit/transaction_cubit.dart';

import 'Pages/BonusPage.dart';
import 'Pages/SuccessPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => DestinationCubit()),
        BlocProvider(create: (context) => SeatCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: SplashPage(),
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStarted(),
          '/signup': (context) => SignupPage(),
          '/signin': (context) => SigninPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          // '/seat': (context) => ChooseSeat(),
          // '/checkout': (context) => CheckoutPage(),
          '/success': (context) => SuccessPage(),
        },
      ),
    );
  }
}
