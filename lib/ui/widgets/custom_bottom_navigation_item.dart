import 'package:airplane_bloc/blocs/page/page_bloc.dart';
import 'package:airplane_bloc/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String imageUrl;
  final int index;

  const CustomBottomNavigationItem({
    super.key,
    required this.imageUrl,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageBloc>().add(ActivePageEvent(index: index));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            imageUrl,
            width: 24,
            height: 24,
            color: context.read<PageBloc>().state.index == index
                ? kPrimaryColor
                : kGreyColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.read<PageBloc>().state.index == index
                  ? kPrimaryColor
                  : kGreyColor,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ],
      ),
    );
  }
}
