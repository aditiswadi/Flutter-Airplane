import 'package:airplane_bloc/models/custom_error.dart';
import 'package:airplane_bloc/models/destination_model.dart';
import 'package:airplane_bloc/repositories/destination_repository.dart';
import 'package:airplane_bloc/repositories/transaction_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'destination_event.dart';
part 'destination_state.dart';

class DestinationBloc extends Bloc<DestinationEvent, DestinationState> {
  DestinationBloc() : super(DestinationState.initial()) {
    on<FectchDestinationEvent>(_fetchDestination);
  }

  void _fetchDestination(
      FectchDestinationEvent event, Emitter<DestinationState> emit) async {
    try {
      emit(state.copyWith(destinationStatus: DestinationStatus.loading));

      List<DestinationModel> destinations =
          await DestinationRepository().fetchDestination();

      emit(
        state.copyWith(
          destinations: destinations,
          destinationStatus: DestinationStatus.succes,
        ),
      );
    } on CustomError catch (e) {
      emit(state.copyWith(
        destinationStatus: DestinationStatus.error,
        error: e,
      ));
    }
  }
}
