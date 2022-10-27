import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageState.initial()) {
    on<ActivePageEvent>(_activePage);
  }

  void _activePage(
    ActivePageEvent event,
    Emitter<PageState> emit,
  ) {
    emit(state.copyWith(index: event.index));
  }
}
