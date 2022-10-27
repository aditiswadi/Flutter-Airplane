part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class CreateTransactionEvent extends TransactionEvent {
  final TransactionModel transaction;
  CreateTransactionEvent({
    required this.transaction,
  });

  @override
  List<Object> get props => [transaction];

  @override
  String toString() => 'CreateTransactionEvent(transaction: $transaction)';
}

class FetchTransactionEvent extends TransactionEvent {}
