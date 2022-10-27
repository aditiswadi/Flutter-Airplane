import 'package:airplane_bloc/blocs/blocs.dart';
import 'package:airplane_bloc/utils/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
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
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.profileStatus == ProfileStatus.error) {
          errorDialog(context, state.error);
        }
      },
      builder: (context, state) {
        if (state.profileStatus == ProfileStatus.loaded) {
          return Scaffold(
            body: Center(
              child: Container(
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
              ),
            ),
          );
        } else if (state.profileStatus == ProfileStatus.initial) {
          return Container();
        } else if (state.profileStatus == ProfileStatus.loading) {
          return CircularProgressIndicator();
        } else {
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
        }
      },
    );
  }
}
