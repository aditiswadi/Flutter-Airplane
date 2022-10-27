part of 'destination_bloc.dart';

enum DestinationStatus {
  initial,
  loading,
  succes,
  error,
}

class DestinationState extends Equatable {
  final List<DestinationModel>? destinations;
  final DestinationStatus destinationStatus;
  final CustomError error;
  DestinationState({
    this.destinations,
    required this.destinationStatus,
    required this.error,
  });

  factory DestinationState.initial() {
    return DestinationState(
        destinationStatus: DestinationStatus.initial, error: CustomError());
  }

  @override
  List<Object?> get props => [destinations, destinationStatus, error];

  @override
  String toString() =>
      'DestinationState(destinations: $destinations, destinationStatus: $destinationStatus, error: $error)';

  DestinationState copyWith({
    List<DestinationModel>? destinations,
    DestinationStatus? destinationStatus,
    CustomError? error,
  }) {
    return DestinationState(
      destinations: destinations ?? this.destinations,
      destinationStatus: destinationStatus ?? this.destinationStatus,
      error: error ?? this.error,
    );
  }
}
