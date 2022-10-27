part of 'transaction_bloc.dart';

enum TransactionStatus {
  initial,
  loading,
  success,
  failed,
}

class TransactionState extends Equatable {
  final TransactionStatus transactionStatus;
  final List<TransactionModel> transactions;
  final CustomError error;
  TransactionState({
    required this.transactionStatus,
    required this.transactions,
    required this.error,
  });

  factory TransactionState.initial() {
    return TransactionState(
      transactionStatus: TransactionStatus.initial,
      error: CustomError(),
      transactions: [],
    );
  }

  @override
  List<Object?> get props => [transactionStatus, transactions, error];

  @override
  String toString() =>
      'TransactionState(transactionStatus: $transactionStatus, transactions: $transactions, error: $error)';

  TransactionState copyWith({
    TransactionStatus? transactionStatus,
    List<TransactionModel>? transactions,
    CustomError? error,
  }) {
    return TransactionState(
      transactionStatus: transactionStatus ?? this.transactionStatus,
      transactions: transactions ?? this.transactions,
      error: error ?? this.error,
    );
  }
}
