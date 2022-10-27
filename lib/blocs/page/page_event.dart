part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class ActivePageEvent extends PageEvent {
  final int index;
  ActivePageEvent({
    required this.index,
  });

  ActivePageEvent copyWith({
    int? index,
  }) {
    return ActivePageEvent(
      index: index ?? this.index,
    );
  }

  @override
  String toString() => 'ActivePageEvent(index: $index)';
}
