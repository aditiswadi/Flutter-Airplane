import 'package:airplane_bloc/models/transaction_model.dart';
import 'package:airplane_bloc/shared/theme.dart';
import 'package:airplane_bloc/ui/widgets/booking_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: DESTINATION TILE
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      transaction.destination.imageUrl,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextSyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      transaction.destination.country,
                      style: greyTextSyle.copyWith(
                        fontWeight: ligth,
                      ),
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
                        image: AssetImage(
                          'assets/icon_star.png',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    transaction.destination.rating.toString(),
                    style: blackTextSyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ],
          ),

          //  NOTE: BOOKING DESTINATION TILE
          Container(
            margin: EdgeInsets.only(top: 28),
            child: Text(
              'Booking Details',
              style: blackTextSyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),

          // NOTE BOOKING ITEMS
          BookingDetailsItem(
            title: 'Traveler',
            valueText: '${transaction.amountOfTraveler}',
            colorText: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Seat',
            valueText: transaction.selectedSeats,
            colorText: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Insurance',
            valueText: transaction.insurance ? 'YES' : 'NO',
            colorText: transaction.insurance ? kGreenColor : kRedColor,
          ),
          BookingDetailsItem(
            title: 'Refundable',
            valueText: transaction.refundable ? 'YES' : 'NO',
            colorText: transaction.refundable ? kGreenColor : kRedColor,
          ),
          BookingDetailsItem(
            title: 'VAT',
            valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
            colorText: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Price',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(
              transaction.price,
            ),
            colorText: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Grand Total',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(
              transaction.grandTotal,
            ),
            colorText: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
