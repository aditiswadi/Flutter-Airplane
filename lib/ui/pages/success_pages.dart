import 'package:airplane_bloc/blocs/blocs.dart';
import 'package:airplane_bloc/shared/theme.dart';
import 'package:airplane_bloc/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: EdgeInsets.only(
                bottom: 80,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_success.png',
                  ),
                ),
              ),
            ),
            Text(
              'Well Booked 😍',
              style: blackTextSyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Are you ready to explore the new\nworld of experiences?',
              style: greyTextSyle.copyWith(
                fontSize: 16,
                fontWeight: ligth,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: 'My Bookings',
              width: 220,
              onPressed: () {
                context.read<PageBloc>().add(ActivePageEvent(index: 1));
                Navigator.pushNamedAndRemoveUntil(
                    context, '/main', (route) => false);
              },
              margin: EdgeInsets.only(
                top: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
