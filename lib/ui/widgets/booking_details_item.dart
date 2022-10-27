import 'package:airplane_bloc/shared/theme.dart';
import 'package:flutter/material.dart';

class BookingDetailsItem extends StatelessWidget {
  final String title;
  final String valueText;
  final Color colorText;
  const BookingDetailsItem({
    super.key,
    required this.title,
    required this.valueText,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 13,
            bottom: 18,
            right: 6,
          ),
          width: 16,
          height: 16,
          child: Icon(
            Icons.check_circle,
            size: 16,
            color: kPrimaryColor,
          ),
        ),
        Text(
          title,
          style: greyTextSyle.copyWith(
            fontSize: 14,
            fontWeight: reguler,
          ),
        ),
        Spacer(),
        Text(
          valueText,
          style: blackTextSyle.copyWith(
            fontSize: 14,
            fontWeight: semiBold,
            color: colorText,
          ),
        ),
      ],
    );
  }
}
