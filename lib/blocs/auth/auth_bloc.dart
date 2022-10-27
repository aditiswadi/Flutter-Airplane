import 'dart:async';

import 'package:airplane_bloc/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription authSubscription;
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthState.unknown()) {
    authSubscription = authRepository.user.listen((fbAuth.User? user) {
      add(AuthStateChangedEvent(user: user));
    });
    on<AuthStateChangedEvent>(_authStateChangedEvent);
    on<SignoutRequestedEvent>(_signoutRequestedEvent);
  }

  void _authStateChangedEvent(
      AuthStateChangedEvent event, Emitter<AuthState> emit) {
    if (event.user != null) {
      emit(state.copyWith(
          authStatus: AuthStatus.authenticated, user: event.user));
    } else {
      emit(state.copyWith(authStatus: AuthStatus.unauthenticated, user: null));
    }
  }

  void _signoutRequestedEvent(
      SignoutRequestedEvent event, Emitter<AuthState> emit) async {
    await authRepository.signOut();
    emit(
      state.copyWith(authStatus: AuthStatus.unknown),
    );
  }
}
