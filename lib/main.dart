import 'package:airplane_bloc/blocs/auth/auth_bloc.dart';
import 'package:airplane_bloc/blocs/destination/destination_bloc.dart';
import 'package:airplane_bloc/blocs/page/page_bloc.dart';
import 'package:airplane_bloc/blocs/profile/profile_bloc.dart';
import 'package:airplane_bloc/blocs/signin/signin_bloc.dart';
import 'package:airplane_bloc/blocs/signup/signup_bloc.dart';
import 'package:airplane_bloc/blocs/transcation/transaction_bloc.dart';
import 'package:airplane_bloc/repositories/auth_repository.dart';
import 'package:airplane_bloc/repositories/destination_repository.dart';
import 'package:airplane_bloc/repositories/profile_repository.dart';
import 'package:airplane_bloc/repositories/transaction_repository.dart';
import 'package:airplane_bloc/ui/pages/bonus_page.dart';
import 'package:airplane_bloc/ui/pages/get_started_page.dart';
import 'package:airplane_bloc/ui/pages/main_page.dart';
import 'package:airplane_bloc/ui/pages/sign_in_page.dart';
import 'package:airplane_bloc/ui/pages/sign_up_page.dart';
import 'package:airplane_bloc/ui/pages/splash_page.dart';
import 'package:airplane_bloc/ui/pages/success_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/seat/seat_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(
              firebaseFirestore: FirebaseFirestore.instance,
              firebaseAuth: FirebaseAuth.instance),
        ),
        RepositoryProvider<ProfileRepository>(
          create: (context) => ProfileRepository(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        RepositoryProvider<DestinationRepository>(
          create: (context) => DestinationRepository(),
        ),
        RepositoryProvider<TransactionRepository>(
          create: (context) => TransactionRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PageBloc(),
          ),
          BlocProvider(
            create: (context) => SeatBloc(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<SignupBloc>(
            create: (context) => SignupBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<SigninBloc>(
            create: (context) => SigninBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(
              profileRepository: context.read<ProfileRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => DestinationBloc(),
          ),
          BlocProvider(
            create: (context) => TransactionBloc(
              transactionRepository: context.read<TransactionRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => SplashPage(),
            '/get-started': (context) => GetStartedPage(),
            '/sign-up': (context) => SignUpPage(),
            '/sign-in': (context) => SignInPage(),
            '/bonus': (context) => BonusPage(),
            '/main': (context) => MainPage(),
            '/success': (context) => SuccessPage(),
          },
        ),
      ),
    );
  }
}
