import 'package:airplane_bloc/blocs/seat/seat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  final String id;
  final bool isAvailable;
  const SeatItem({
    super.key,
    required this.id,
    this.isAvailable = true,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatBloc>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else if (isSelected) {
        return kPrimaryColor;
      } else {
        return kAvailableColor;
      }
    }

    borderColor() {
      if (isAvailable) {
        return kPrimaryColor;
      } else {
        return kUnavailableColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextSyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
            ),
          ),
        );
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatBloc>().add(SelectSeatEvent(id: id));
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor(),
            width: 2,
          ),
          color: backgroundColor(),
        ),
        child: child(),
      ),
    );
  }
}
