import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splashscreen/Widget/BookingDetails.dart';
import 'package:splashscreen/cubit/models/TransactionModel.dart';

import '../theme.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        image: NetworkImage(transaction.destination.imageUrl),
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
                    details: '${(transaction.vat * 100).toStringAsFixed(0)}%'),
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
  }
}
