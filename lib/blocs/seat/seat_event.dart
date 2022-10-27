part of 'seat_bloc.dart';

abstract class SeatEvent extends Equatable {
  const SeatEvent();

  @override
  List<Object> get props => [];
}

class SelectSeatEvent extends SeatEvent {
  final String id;
  SelectSeatEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class IsSelectedEvent extends SeatEvent {
  final String id;
  IsSelectedEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
