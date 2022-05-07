import 'package:flutter/material.dart';
import 'package:splashscreen/Pages/PageDetails.dart';
import 'package:splashscreen/Widget/DestinationTile.dart';
import 'package:splashscreen/Widget/DestinationsCard.dart';
import 'package:splashscreen/cubit/auth_cubit.dart';
import 'package:splashscreen/cubit/destination_cubit.dart';
import 'package:splashscreen/cubit/models/DestinationModel.dart';
import 'package:splashscreen/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget PopularDestinations(List<DestinationModel> destinations) =>
        Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: destinations.map((DestinationModel destination) {
                return DestinationCards(destination);
              }).toList(),
            ),
          ),
        );

    Widget title() => BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Container(
                margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Howdy,\n ${state.user.name}',
                            style: blackTextStyle.copyWith(
                                fontSize: 24, fontWeight: semiBold),
                          ),
                          Text(
                            'Where to fly today ?',
                            style: greyTextStyle.copyWith(
                                fontSize: 16, fontWeight: light),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/img/image_profile.png'))),
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          },
        );
    Widget DestinationsTile(List<DestinationModel> destinations) => Container(
          margin: EdgeInsets.only(
              top: 30, left: defaultMargin, right: defaultMargin, bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New This Year',
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      children:
                          destinations.map((DestinationModel destination) {
                    return DestinationTile(destination);
                  }).toList()))
            ],
          ),
        );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<DestinationCubit, DestinationState>(
          listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: kRedColor,
          ));
        }
        // TODO: implement listener
      }, builder: (context, state) {
        if (state is DestinationSuccess) {
          return ListView(
            children: [
              title(),
              PopularDestinations(state.destinations),
              DestinationsTile(state.destinations),
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
