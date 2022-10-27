import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String title;
  final bool obscure;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final ValueChanged? onSaved;

  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.obscure = false,
    this.controller,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextSyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            cursorColor: kBlackColor,
            obscureText: obscure,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  17,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  17,
                ),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
            validator: validator,
            onSaved: onSaved,
          ),
        ],
      ),
    );
  }
}
