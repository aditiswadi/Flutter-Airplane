import 'package:airplane_bloc/blocs/auth/auth_bloc.dart';
import 'package:airplane_bloc/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.authStatus == AuthStatus.unknown) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/sign-in', (route) => false);
            }
          },
          builder: (context, state) {
            return CustomButton(
                title: 'Log Out',
                width: 220,
                onPressed: () {
                  context.read<AuthBloc>().add(
                        SignoutRequestedEvent(),
                      );
                });
          },
        ),
      ),
    );
  }
}
