part of 'seat_bloc.dart';

class SeatState extends Equatable {
  final List<String> id;
  SeatState({
    required this.id,
  });

  factory SeatState.initial() {
    return SeatState(id: []);
  }

  SeatState copyWith({
    List<String>? id,
  }) {
    return SeatState(
      id: id ?? this.id,
    );
  }

  @override
  String toString() => 'SeatState(id: $id)';

  @override
  List<Object> get props => [id];
}
