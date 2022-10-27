import 'package:airplane_bloc/models/custom_error.dart';
import 'package:airplane_bloc/models/user_model.dart';
import 'package:airplane_bloc/repositories/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc({required this.profileRepository})
      : super(ProfileState.initial()) {
    on<GetProfileEvent>(_getProfile);
  }

  Future<void> _getProfile(
      GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));

    try {
      final UserModel user = await profileRepository.getProfile(uid: event.uid);
      emit(state.copyWith(
        profileStatus: ProfileStatus.loaded,
        user: user,
      ));
    } on CustomError catch (e) {
      emit(state.copyWith(profileStatus: ProfileStatus.error, error: e));
    }
  }
}
