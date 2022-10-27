import 'package:airplane_bloc/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/custom_error.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthRepository authRepository;
  SigninBloc({required this.authRepository}) : super(SigninState.initial()) {
    on<SigninRequestedEvent>(_signin);
  }

  Future<void> _signin(
      SigninRequestedEvent event, Emitter<SigninState> emit) async {
    emit(state.copyWith(signinStatus: SigninStatus.submitting));
    try {
      await authRepository.signIn(email: event.email, password: event.password);
      emit(state.copyWith(signinStatus: SigninStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(signinStatus: SigninStatus.error, error: e));
    }
  }
}
