part of 'page_bloc.dart';

class PageState extends Equatable {
  final int index;
  PageState({
    required this.index,
  });

  factory PageState.initial() {
    return PageState(index: 0);
  }

  @override
  List<Object> get props => [index];

  PageState copyWith({
    int? index,
  }) {
    return PageState(
      index: index ?? this.index,
    );
  }

  @override
  String toString() => 'PageState(index: $index)';
}
