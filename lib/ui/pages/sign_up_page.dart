import 'package:airplane_bloc/blocs/signup/signup_bloc.dart';
import 'package:airplane_bloc/shared/theme.dart';
import 'package:airplane_bloc/ui/widgets/custom_button.dart';
import 'package:airplane_bloc/ui/widgets/custom_text_form_field.dart';
import 'package:airplane_bloc/utils/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';
import '../../blocs/blocs.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _passwordController = TextEditingController();
  String? _name, _email, _password;

  void _submit() {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    context.read<SignupBloc>().add(SignupRequestedEvent(
        name: _name!, email: _email!, password: _password!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.signupStatus == SignupStatus.error) {
          return errorDialog(context, state.customError);
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                children: [
                  title(),
                  inputSection(),
                  signInButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: Text(
        'Join us and get\nyour next journey',
        style: blackTextSyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold,
        ),
      ),
    );
  }

  Widget inputSection() {
    Widget nameInput() {
      return CustomTextFormField(
        title: 'Full Name',
        hintText: 'Your Full Name',
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Name Required';
          }
          if (value.trim().length < 2) {
            return 'Name must be at least 2 characters';
          }
          return null;
        },
        onSaved: (value) {
          _name = value;
        },
      );
    }

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
        controller: _passwordController,
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

    Widget confirmPasswordInput() {
      return CustomTextFormField(
        title: 'Confirm Password',
        hintText: 'Confirm Password',
        obscure: true,
        validator: (value) {
          if (_passwordController.text != value) {
            return 'Password not match';
          }
          return null;
        },
      );
    }

    Widget submitButton() {
      return BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state.signupStatus == SignupStatus.success) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/bonus', (route) => false);
          }
        },
        builder: (context, state) {
          return CustomButton(
            margin: const EdgeInsets.only(
              top: 20,
            ),
            width: 287,
            onPressed: () {
              state.signupStatus == SignupStatus.submitting ? null : _submit();
            },
            title: state.signupStatus == SignupStatus.submitting
                ? 'Submitting...'
                : 'Sign Up',
          );
        },
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          nameInput(),
          emailInput(),
          passwordInput(),
          confirmPasswordInput(),
          submitButton(),
        ],
      ),
    );
  }

  Widget signInButton() {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            state.signupStatus == SignupStatus.submitting
                ? null
                : Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(
              top: 50,
              bottom: 73,
            ),
            alignment: Alignment.center,
            child: Text(
              'Have an account? Sign In',
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
}
