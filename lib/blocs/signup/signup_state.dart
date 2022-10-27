part of 'signup_bloc.dart';

enum SignupStatus {
  initial,
  submitting,
  success,
  error,
}

class SignupState extends Equatable {
  final SignupStatus signupStatus;
  final CustomError customError;
  SignupState({
    required this.signupStatus,
    required this.customError,
  });

  @override
  List<Object> get props => [signupStatus, customError];

  factory SignupState.initial() {
    return SignupState(
      signupStatus: SignupStatus.initial,
      customError: CustomError(),
    );
  }

  @override
  String toString() =>
      'SignupState(signupStatus: $signupStatus, customError: $customError)';

  SignupState copyWith({
    SignupStatus? signupStatus,
    CustomError? customError,
  }) {
    return SignupState(
      signupStatus: signupStatus ?? this.signupStatus,
      customError: customError ?? this.customError,
    );
  }
}
