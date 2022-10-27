part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupRequestedEvent extends SignupEvent {
  final String name;
  final String email;
  final String password;
  SignupRequestedEvent({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, password];
}
