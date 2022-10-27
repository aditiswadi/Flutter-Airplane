import 'package:airplane_bloc/models/custom_error.dart';
import 'package:airplane_bloc/models/transaction_model.dart';
import 'package:airplane_bloc/repositories/transaction_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final TransactionRepository transactionRepository;
  TransactionBloc({
    required this.transactionRepository,
  }) : super(TransactionState.initial()) {
    on<CreateTransactionEvent>(_createTransaction);
    on<FetchTransactionEvent>(_fetchTransactionEvent);
  }

  void _createTransaction(
      CreateTransactionEvent event, Emitter<TransactionState> emit) async {
    try {
      emit(
        state.copyWith(transactionStatus: TransactionStatus.loading),
      );

      await transactionRepository.createTransaction(
          transaction: event.transaction);

      emit(
        state.copyWith(
          transactionStatus: TransactionStatus.success,
          transactions: [],
        ),
      );
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          transactionStatus: TransactionStatus.failed,
          error: e,
        ),
      );
    }
  }

  void _fetchTransactionEvent(
    FetchTransactionEvent event,
    Emitter<TransactionState> emit,
  ) async {
    try {
      emit(state.copyWith(transactionStatus: TransactionStatus.loading));

      List<TransactionModel> transactions =
          await transactionRepository.fetchTransaction();
      emit(state.copyWith(
          transactions: transactions,
          transactionStatus: TransactionStatus.success));
    } on CustomError catch (e) {
      state.copyWith(
        transactionStatus: TransactionStatus.failed,
        error: e,
      );
    }
  }
}
