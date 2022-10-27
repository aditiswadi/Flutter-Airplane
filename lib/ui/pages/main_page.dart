import 'package:airplane_bloc/shared/theme.dart';
import 'package:airplane_bloc/ui/pages/home_page.dart';
import 'package:airplane_bloc/ui/pages/settings_page.dart';
import 'package:airplane_bloc/ui/pages/transaction_page.dart';
import 'package:airplane_bloc/ui/pages/wallet_page.dart';
import 'package:airplane_bloc/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/page/page_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      if (context.watch<PageBloc>().state.index == 0) {
        return HomePage();
      } else if (context.watch<PageBloc>().state.index == 1) {
        return TransactionPage();
      } else if (context.watch<PageBloc>().state.index == 2) {
        return WalletPage();
      } else if (context.watch<PageBloc>().state.index == 3) {
        return SettingsPage();
      } else {
        return HomePage();
      }
    }

    Widget customButtonNavigationItem() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 60,
          width: double.infinity,
          margin: const EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 30,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              18,
            ),
            color: kWhiteColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_home.png',
                index: 0,
              ),
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_booking.png',
                index: 1,
              ),
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_card.png',
                index: 2,
              ),
              CustomBottomNavigationItem(
                imageUrl: 'assets/icon_settings.png',
                index: 3,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          buildContent(),
          customButtonNavigationItem(),
        ],
      ),
    );
  }
}
