import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class InterestsItem extends StatelessWidget {
  final String name;
  const InterestsItem({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(
              right: 6,
            ),
            child: Icon(
              Icons.check_circle,
              size: 16,
              color: kPrimaryColor,
            ),
          ),
          Text(
            name,
            style: blackTextSyle.copyWith(
              fontSize: 14,
              fontWeight: reguler,
            ),
          ),
        ],
      ),
    );
  }
}
