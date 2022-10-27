import 'package:airplane_bloc/models/destination_model.dart';
import 'package:airplane_bloc/models/transaction_model.dart';
import 'package:airplane_bloc/shared/theme.dart';
import 'package:airplane_bloc/ui/pages/checkout_pages.dart';
import 'package:airplane_bloc/ui/widgets/custom_button.dart';
import 'package:airplane_bloc/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../blocs/blocs.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;

  const ChooseSeatPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 60),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextSyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 16,
                height: 16,
                margin: EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: kPrimaryColor,
                    width: 2,
                  ),
                  color: kAvailableColor,
                ),
              ),
              Text(
                'Available',
                style: blackTextSyle.copyWith(
                  fontSize: 14,
                  fontWeight: reguler,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 16,
                height: 16,
                margin: EdgeInsets.only(right: 6),
                child: Image.asset(
                  'assets/icon_available.png',
                  color: kPrimaryColor,
                ),
              ),
              Text(
                'Selected',
                style: blackTextSyle.copyWith(
                  fontSize: 14,
                  fontWeight: reguler,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: 16,
                height: 16,
                margin: EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: kUnavailableColor,
                    width: 2,
                  ),
                  color: kUnavailableColor,
                ),
              ),
              Text(
                'Unavailable',
                style: blackTextSyle.copyWith(
                  fontSize: 14,
                  fontWeight: reguler,
                ),
              ),
            ],
          ),
        ),
      );
    }

    selectSeats() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            // SEAT INDICATORS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'A',
                      style: greyTextSyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'B',
                      style: greyTextSyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      '',
                      style: greyTextSyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'C',
                      style: greyTextSyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  width: 48,
                  height: 48,
                  child: Center(
                    child: Text(
                      'D',
                      style: greyTextSyle.copyWith(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),

            // NOTE: SEAT 1
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(
                    id: 'A1',
                    isAvailable: false,
                  ),
                  SeatItem(
                    id: 'B1',
                    isAvailable: false,
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '1',
                        style: greyTextSyle.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  SeatItem(
                    id: 'C1',
                  ),
                  SeatItem(
                    id: 'D1',
                    isAvailable: false,
                  ),
                ],
              ),
            ),

            // NOTE: SEAT 2
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(
                    id: 'A2',
                  ),
                  SeatItem(
                    id: 'B2',
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '2',
                        style: greyTextSyle.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  SeatItem(
                    id: 'C2',
                  ),
                  SeatItem(
                    id: 'D2',
                    isAvailable: false,
                  ),
                ],
              ),
            ),

            // NOTE: SEAT 3
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(
                    id: 'A3',
                  ),
                  SeatItem(
                    id: 'B3',
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '3',
                        style: greyTextSyle.copyWith(fontSize: 16),
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
            ),

            // NOTE: SEAT 4
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(
                    id: 'A4',
                  ),
                  SeatItem(
                    id: 'B4',
                    isAvailable: false,
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '4',
                        style: greyTextSyle.copyWith(fontSize: 16),
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
            ),

            // NOTE: SEAT 5
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(
                    id: 'A5',
                  ),
                  SeatItem(
                    id: 'B5',
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Text(
                        '5',
                        style: greyTextSyle.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                  SeatItem(
                    id: 'C5',
                    isAvailable: false,
                  ),
                  SeatItem(
                    id: 'D5',
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                top: 30,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Seat',
                        style: greyTextSyle.copyWith(
                          fontSize: 14,
                          fontWeight: ligth,
                        ),
                      ),
                      BlocBuilder<SeatBloc, SeatState>(
                        builder: (context, state) {
                          return Text(
                            state.id.join(', '),
                            style: blackTextSyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 16,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greyTextSyle.copyWith(
                          fontSize: 14,
                          fontWeight: ligth,
                        ),
                      ),
                      BlocBuilder<SeatBloc, SeatState>(
                        builder: (context, state) {
                          return Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(
                              state.id.length * destination.price,
                            ),
                            style: purpleTextSyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return BlocBuilder<SeatBloc, SeatState>(
        builder: (context, state) {
          return CustomButton(
            title: 'Continue to Checkout',
            width: 327,
            onPressed: () {
              int price = destination.price * state.id.length;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    TransactionModel(
                      destination: destination,
                      amountOfTraveler: state.id.length,
                      selectedSeats: state.id.join(', '),
                      insurance: true,
                      refundable: false,
                      vat: 0.45,
                      price: price,
                      grandTotal: price + (price * 0.45).toInt(),
                    ),
                  ),
                ),
              );
            },
            margin: EdgeInsets.only(top: 30),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          title(),
          seatStatus(),
          selectSeats(),
          checkoutButton(),
        ],
      ),
    );
  }
}
