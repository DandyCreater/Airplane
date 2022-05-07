import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:splashscreen/Widget/BookingDetails.dart';
import 'package:splashscreen/Widget/CustomButton.dart';
import 'package:splashscreen/Widget/DestinationTile.dart';
import 'package:splashscreen/cubit/auth_cubit.dart';
import 'package:splashscreen/cubit/models/TransactionModel.dart';
import 'package:splashscreen/cubit/page_cubit.dart';
import 'package:splashscreen/cubit/transaction_cubit.dart';
import 'package:splashscreen/theme.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;

  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget FirstContent() => Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Container(
                width: 291,
                height: 65,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/image_checkout.png'))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CGK',
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold)),
                      Text(
                        'Tangerang',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('TLC',
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold)),
                      Text(
                        'Ciliwung',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        );

    Widget SecondContent() => Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18), color: kWhiteColor),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            image:
                                NetworkImage(transaction.destination.imageUrl),
                            fit: BoxFit.cover)),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.destination.name,
                          style: blackTextStyle.copyWith(
                              fontWeight: medium, fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          transaction.destination.city,
                          style: greyTextStyle.copyWith(fontWeight: light),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        margin: EdgeInsets.only(right: 2),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/img/icon_star.png'))),
                      ),
                      Text(
                        transaction.destination.rating.toString(),
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking Details',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    BookingDetails(
                        title: 'Traveler',
                        details: '${transaction.amountOfTraveler} person'),
                    BookingDetails(
                        title: 'Seat', details: transaction.selectedSeats),
                    BookingDetails(
                      title: 'Insurance',
                      details: transaction.insurance ? 'YES' : 'NO',
                      color: transaction.insurance ? kGreenColor : kRedColor,
                    ),
                    BookingDetails(
                      title: 'Refundable',
                      details: transaction.refundable ? 'YES' : 'NO',
                      color: transaction.refundable ? kGreenColor : kRedColor,
                    ),
                    BookingDetails(
                        title: 'VAT',
                        details:
                            '${(transaction.vat * 100).toStringAsFixed(0)}%'),
                    BookingDetails(
                      title: 'Price',
                      details: NumberFormat.currency(
                              locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                          .format(transaction.price),
                    ),
                    BookingDetails(
                      title: 'Grand Total',
                      details: NumberFormat.currency(
                              locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                          .format(transaction.grandTotal),
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

    Widget ThirdContent() {
      return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: kPrimaryColor.withOpacity(0.5),
                              blurRadius: 50,
                              offset: Offset(0, 10),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 24,
                            width: 24,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/img/iconplane.png'),
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
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(state.user.balance),
                            style: blackTextStyle.copyWith(
                                fontSize: 18, fontWeight: medium),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Current Balance',
                            style: greyTextStyle.copyWith(fontWeight: light),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      });
    }

    Widget PayButton() => BlocConsumer<TransactionCubit, TransactionState>(
          listener: (context, state) {
            print(state);
            if (state is TransactionSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/success', (route) => false);
            } else if (state is TransactionFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: kRedColor,
              ));
            }
          },
          builder: (context, state) {
            if (state is TransactionLoading) {
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(),
              );
            }
            return CustomButtom(
              title: 'Pay Now',
              onPressed: () {
                context.read<TransactionCubit>().createTransaction(transaction);
              },
              margin: EdgeInsets.only(top: 20, bottom: 20),
            );
          },
        );

    Widget TacButton() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(
            top: 10,
            bottom: 20,
          ),
          child: Text(
            'Terms and Condition',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.purple,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          FirstContent(),
          SecondContent(),
          ThirdContent(),
          PayButton(),
          TacButton(),
        ],
      ),
    );
  }
}
