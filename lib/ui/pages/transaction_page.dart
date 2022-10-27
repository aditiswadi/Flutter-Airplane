import 'package:airplane_bloc/blocs/transcation/transaction_bloc.dart';
import 'package:airplane_bloc/ui/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionBloc>().add(FetchTransactionEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        if (state.transactionStatus == TransactionStatus.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.transactionStatus == TransactionStatus.success) {
          if (state.transactions.length == 0) {
            return Center(
              child: Text('Transactions not found'),
            );
          } else {
            return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24),
                itemCount: state.transactions.length,
                itemBuilder: (context, index) {
                  return TransactionCard(
                    state.transactions[index],
                  );
                });
          }
        }

        return Center(
          child: Text('Transaction Page'),
        );
      },
    );
  }
}
