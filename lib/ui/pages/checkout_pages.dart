import 'package:airplane_bloc/blocs/blocs.dart';
import 'package:airplane_bloc/blocs/transcation/transaction_bloc.dart';
import 'package:airplane_bloc/models/transaction_model.dart';
import 'package:airplane_bloc/shared/theme.dart';
import 'package:airplane_bloc/ui/widgets/booking_details_item.dart';
import 'package:airplane_bloc/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckoutPage(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Column(
        children: [
          Container(
            width: 327,
            height: 132,
            margin: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/image_checkout.png',
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DEPARTURE',
                style: greyTextSyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              Text(
                transaction.destination.country,
                style: blackTextSyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget bookingDetails() {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        margin: EdgeInsets.only(
          top: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaction.destination.country,
                        style: greyTextSyle.copyWith(
                          fontSize: 14,
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
                      width: 20,
                      height: 20,
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
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Booking Details',
              style: blackTextSyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
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
              valueText: '${(transaction.vat * 100).toString()}%',
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
              colorText: kBlackColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 30,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 6),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/icon_plane.png',
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Pay',
                    style: whiteTextSyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state.profileStatus == ProfileStatus.loaded) {
                        return Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'IDR ',
                            decimalDigits: 0,
                          ).format(state.user.balance),
                          style: blackTextSyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  Text(
                    'Current Balance',
                    style: greyTextSyle.copyWith(
                      fontSize: 14,
                      fontWeight: ligth,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget payButton() {
      return BlocConsumer<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state.transactionStatus == TransactionStatus.success) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          }
        },
        builder: (context, state) {
          return CustomButton(
            title: state.transactionStatus == TransactionStatus.loading
                ? 'Loading...'
                : 'Pay Now',
            width: double.infinity,
            onPressed: () {
              context
                  .read<TransactionBloc>()
                  .add(CreateTransactionEvent(transaction: transaction));
            },
            margin: EdgeInsets.only(bottom: 30),
          );
        },
      );
    }

    Widget tacButton() {
      return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Text(
            'Terms and Conditions',
            style: greyTextSyle.copyWith(
              fontSize: 16,
              fontWeight: ligth,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          route(),
          bookingDetails(),
          paymentDetails(),
          payButton(),
          tacButton(),
        ],
      ),
    );
  }
}
