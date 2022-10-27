import 'package:airplane_bloc/models/destination_model.dart';
import 'package:airplane_bloc/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class DestinationCard extends StatelessWidget {
  final DestinationModel destination;

  const DestinationCard({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              destination: destination,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 24,
        ),
        height: 323,
        width: 200,
        padding: const EdgeInsets.all(
          10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              18,
            ),
            color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  18,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    destination.imageUrl,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                        18,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(
                          right: 2,
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/icon_star.png',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        destination.rating.toString(),
                        style: blackTextSyle.copyWith(
                          fontSize: 14,
                          fontWeight: reguler,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                top: 20,
              ),
              child: Text(
                destination.name,
                style: blackTextSyle.copyWith(
                  fontSize: 18,
                  fontWeight: reguler,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                destination.country,
                style: greyTextSyle.copyWith(fontWeight: ligth),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
