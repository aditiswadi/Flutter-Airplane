import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class SeatStatus extends StatelessWidget {
  final String status;
  final String imageUrl;
  const SeatStatus({
    super.key,
    required this.status,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            child: Image.asset(
              imageUrl,
            ),
          ),
          Text(
            status,
            style: blackTextSyle.copyWith(
              fontSize: 14,
              fontWeight: reguler,
            ),
          )
        ],
      ),
    );
  }
}
