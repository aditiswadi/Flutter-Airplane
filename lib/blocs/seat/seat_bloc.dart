import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'seat_event.dart';
part 'seat_state.dart';

class SeatBloc extends Bloc<SeatEvent, SeatState> {
  SeatBloc() : super(SeatState.initial()) {
    on<SelectSeatEvent>(_selectSeat);
  }

  void _selectSeat(SelectSeatEvent event, Emitter<SeatState> emit) {
    if (!isSelected(event.id)) {
      emit(state.copyWith(id: List.from(state.id)..add(event.id)));
      print(state);
    } else {
      emit(state.copyWith(id: List.from(state.id)..remove(event.id)));
      print(state);
    }
  }

  bool isSelected(String id) {
    int index = state.id.indexOf(id);
    if (index == -1) {
      return false;
    }
    return true;
  }
}
