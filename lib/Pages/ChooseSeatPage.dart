import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:splashscreen/Pages/CheckoutPage.dart';
import 'package:splashscreen/Widget/CustomButton.dart';
import 'package:splashscreen/Widget/SeatItem.dart';
import 'package:splashscreen/Widget/SeatStatusItem.dart';
import 'package:splashscreen/cubit/models/DestinationModel.dart';
import 'package:splashscreen/cubit/models/TransactionModel.dart';
import 'package:splashscreen/cubit/seat_cubit.dart';
import 'package:splashscreen/theme.dart';

class ChooseSeat extends StatelessWidget {
  final DestinationModel destination;

  const ChooseSeat(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget Title() => Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Text(
          'Select Your\nFavourite Seat',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ));

    Widget SeatStatus() => Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SeatStatusItem(
                ImageUrl: ('assets/img/icon_available.png'), text: 'Avalaible'),
            SeatStatusItem(
                ImageUrl: ('assets/img/icon_selected.png'), text: 'Selected'),
            SeatStatusItem(
                ImageUrl: ('assets/img/icon_unavailable.png'),
                text: 'Unavalaible'),
          ],
        ));

    Widget Seats() => BlocBuilder<SeatCubit, List<String>>(
          builder: (context, state) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 22),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: kWhiteColor),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            'A',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            'B',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            'C',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            'D',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        isAvailable: false,
                        id: 'A1',
                      ),
                      SeatItem(
                        isAvailable: false,
                        id: 'B1',
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '1',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C1',
                      ),
                      SeatItem(
                        id: 'D1',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A2',
                      ),
                      SeatItem(
                        id: 'B2',
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '2',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C2',
                      ),
                      SeatItem(
                        id: 'D2',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A3',
                      ),
                      SeatItem(
                        id: 'B3',
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '3',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C3',
                      ),
                      SeatItem(
                        id: 'D3',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A4',
                      ),
                      SeatItem(
                        id: 'B4',
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '4',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C4',
                      ),
                      SeatItem(
                        id: 'D4',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A5',
                      ),
                      SeatItem(
                        id: 'B5',
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '5',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C5',
                      ),
                      SeatItem(
                        id: 'D5',
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Seat',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        ),
                        Text(
                          state.join(', '),
                          style: blackTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                            .format(state.length * destination.price),
                        style: purpleTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );

    Widget CheckoutButton() => BlocBuilder<SeatCubit, List<String>>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 22, horizontal: 30),
              child: CustomButtom(
                title: 'Continue to Checkout',
                onPressed: () {
                  int price = destination.price * state.length;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckoutPage(TransactionModel(
                              destination: destination,
                              amountOfTraveler: state.length,
                              selectedSeats: state.join(', '),
                              insurance: true,
                              refundable: false,
                              vat: 0.45,
                              price: price,
                              grandTotal: price + (price * 0.45).toInt()))));
                },
                // onPressed: () {
                //   Navigator.pushNamed(context, '/checkout');
                // })
              ),
            );
          },
        );

    return Scaffold(
      body: ListView(
        children: [
          Title(),
          SeatStatus(),
          Seats(),
          CheckoutButton(),
        ],
      ),
    );
  }
}
