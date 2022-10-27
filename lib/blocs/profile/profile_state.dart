part of 'profile_bloc.dart';

enum ProfileStatus {
  initial,
  loading,
  loaded,
  error,
}

class ProfileState extends Equatable {
  final ProfileStatus profileStatus;
  final UserModel user;
  final CustomError error;
  ProfileState({
    required this.profileStatus,
    required this.user,
    required this.error,
  });

  factory ProfileState.initial() {
    return ProfileState(
      profileStatus: ProfileStatus.initial,
      user: UserModel.initialUser(),
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [profileStatus, user, error];

  @override
  String toString() =>
      'ProfileState(profileStatus: $profileStatus, user: $user, error: $error)';

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    UserModel? user,
    CustomError? error,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}
