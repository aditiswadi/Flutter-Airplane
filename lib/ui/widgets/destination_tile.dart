import 'package:airplane_bloc/models/destination_model.dart';
import 'package:airplane_bloc/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class DestinationTile extends StatelessWidget {
  final DestinationModel destination;

  const DestinationTile({
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(destination: destination),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        padding: const EdgeInsets.all(
          10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            18,
          ),
          color: kWhiteColor,
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(
                right: 16,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    destination.imageUrl,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  18,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: blackTextSyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    destination.country,
                    style: greyTextSyle.copyWith(
                      fontSize: 14,
                      fontWeight: ligth,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/icon_star.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 16,
                  ),
                  child: Text(
                    destination.rating.toString(),
                    style: blackTextSyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
