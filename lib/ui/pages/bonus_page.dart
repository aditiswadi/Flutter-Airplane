import 'package:airplane_bloc/blocs/blocs.dart';
import 'package:airplane_bloc/shared/theme.dart';
import 'package:airplane_bloc/ui/widgets/custom_button.dart';
import 'package:airplane_bloc/utils/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BonusPage extends StatefulWidget {
  const BonusPage({super.key});

  @override
  State<BonusPage> createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
  @override
  void initState() {
    _getProfile();
    super.initState();
  }

  void _getProfile() {
    final String uid = context.read<AuthBloc>().state.user!.uid;
    context.read<ProfileBloc>().add(GetProfileEvent(uid: uid));
  }

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.profileStatus == ProfileStatus.error) {
            errorDialog(context, state.error);
          }
        },
        builder: (context, state) {
          if (state.profileStatus == ProfileStatus.initial) {
            return Container();
          } else if (state.profileStatus == ProfileStatus.loading) {
            return CircularProgressIndicator();
          } else if (state.profileStatus == ProfileStatus.error) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/error.png',
                    width: 75,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Oooops!\nTry again',
                    textAlign: TextAlign.center,
                    style: redTextSyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              width: 300,
              height: 211,
              padding: const EdgeInsets.all(
                24,
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(38),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: whiteTextSyle.copyWith(
                                fontSize: 14,
                                fontWeight: ligth,
                              ),
                            ),
                            Text(
                              state.user.name,
                              style: whiteTextSyle.copyWith(
                                fontSize: 20,
                                fontWeight: reguler,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.only(
                          right: 6,
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/icon_plane.png',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'PAY',
                        style: whiteTextSyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  Text(
                    'Balance',
                    style: whiteTextSyle.copyWith(
                      fontSize: 14,
                      fontWeight: ligth,
                    ),
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'IDR ',
                      decimalDigits: 0,
                    ).format(state.user.balance),
                    style: whiteTextSyle.copyWith(
                      fontSize: 26,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      );
    }

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(
          top: 80,
        ),
        child: Text(
          'Big Bonus 🎉',
          style: blackTextSyle.copyWith(
            fontSize: 32,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget subTitle() {
      return Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        child: Text(
          'We give you early credit so that\nyou can buy a flight ticket',
          style: greyTextSyle.copyWith(
            fontSize: 16,
            fontWeight: ligth,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget startButton() {
      return CustomButton(
        title: 'Start Fly Now',
        width: 220,
        margin: const EdgeInsets.only(
          top: 50,
        ),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            title(),
            subTitle(),
            startButton(),
          ],
        ),
      ),
    );
  }
}
