import 'package:airplane_bloc/models/custom_error.dart';
import 'package:airplane_bloc/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;
  SignupBloc({required this.authRepository}) : super(SignupState.initial()) {
    on<SignupRequestedEvent>(_signup);
  }

  Future<void> _signup(
      SignupRequestedEvent event, Emitter<SignupState> emit) async {
    emit(state.copyWith(signupStatus: SignupStatus.submitting));

    try {
      await authRepository.signUp(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      emit(state.copyWith(signupStatus: SignupStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(signupStatus: SignupStatus.error, customError: e));
    }
  }
}
