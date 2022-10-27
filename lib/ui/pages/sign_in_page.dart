import 'package:airplane_bloc/blocs/blocs.dart';
import 'package:airplane_bloc/blocs/signin/signin_bloc.dart';
import 'package:airplane_bloc/shared/theme.dart';
import 'package:airplane_bloc/ui/widgets/custom_button.dart';
import 'package:airplane_bloc/ui/widgets/custom_text_form_field.dart';
import 'package:airplane_bloc/utils/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email, _password;

  void _submit() {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    context
        .read<SigninBloc>()
        .add(SigninRequestedEvent(email: _email!, password: _password!));
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: Text(
          'Sign In with\nyour existing account',
          style: blackTextSyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email Address',
          hintText: 'Your Email Address',
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Email Required';
            }
            if (!isEmail(value.trim())) {
              return 'Enter a valid email';
            }
            return null;
          },
          onSaved: (value) {
            _email = value;
          },
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Your Password',
          obscure: true,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Password Required';
            }
            if (value.trim().length < 6) {
              return 'Password must be at least 6 characters long';
            }
            return null;
          },
          onSaved: (value) {
            _password = value;
          },
        );
      }

      Widget submitButton() {
        return BlocConsumer<SigninBloc, SigninState>(
          listener: (context, state) {
            if (state.signinStatus == SigninStatus.success) {
              Navigator.pushNamed(context, '/main');
            }
          },
          builder: (context, state) {
            return CustomButton(
              width: 287,
              margin: const EdgeInsets.only(
                top: 30,
              ),
              onPressed: () {
                context.read<PageBloc>().add(ActivePageEvent(index: 0));
                state.signinStatus == SigninStatus.submitting
                    ? null
                    : _submit();
              },
              title: state.signinStatus == SigninStatus.submitting
                  ? 'Submitting...'
                  : 'Sign In',
            );
          },
        );
      }

      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton(),
          ],
        ),
      );
    }

    Widget signUpButton() {
      return BlocBuilder<SigninBloc, SigninState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              state.signinStatus == SigninStatus.submitting
                  ? null
                  : Navigator.pushNamed(context, '/sign-up');
            },
            child: Container(
              margin: const EdgeInsets.only(
                top: 50,
                bottom: 73,
              ),
              alignment: Alignment.center,
              child: Text(
                'Don\'t have an account? Sign Up',
                style: greyTextSyle.copyWith(
                  fontSize: 16,
                  fontWeight: ligth,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          );
        },
      );
    }

    return BlocConsumer<SigninBloc, SigninState>(
      listener: (context, state) {
        if (state.signinStatus == SigninStatus.error) {
          return errorDialog(context, state.error);
        } else if (state.signinStatus == SigninStatus.success) {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: SafeArea(
            child: Form(
              key: _formKey,
              autovalidateMode: autovalidateMode,
              child: ListView(
                shrinkWrap: true,
                reverse: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                children: [
                  title(),
                  inputSection(),
                  signUpButton(),
                ].reversed.toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
