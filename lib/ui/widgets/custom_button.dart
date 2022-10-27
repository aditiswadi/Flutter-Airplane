import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomButton extends StatelessWidget {
  final EdgeInsets margin;
  final double width;
  final Function() onPressed;
  final String title;
  const CustomButton({
    super.key,
    required this.title,
    required this.width,
    this.margin = EdgeInsets.zero,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: 55,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: whiteTextSyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
