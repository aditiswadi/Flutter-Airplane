import 'package:airplane_bloc/blocs/blocs.dart';
import 'package:airplane_bloc/shared/theme.dart';
import 'package:airplane_bloc/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/image_get_started.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like a Bird',
                  style: whiteTextSyle.copyWith(
                    fontSize: 32,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Explore new world with us and let\nyourself get an amazing experiences',
                  style: whiteTextSyle.copyWith(
                    fontWeight: ligth,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CustomButton(
                      title: 'Get Started',
                      width: 220,
                      margin: const EdgeInsets.only(
                        bottom: 80,
                      ),
                      onPressed: () {
                        if (state.authStatus == AuthStatus.authenticated) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/main', (route) => false);
                        } else if (state.authStatus ==
                            AuthStatus.unauthenticated) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/sign-in', (route) => false);
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
