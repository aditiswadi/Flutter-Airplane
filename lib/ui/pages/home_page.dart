import 'package:airplane_bloc/blocs/blocs.dart';
import 'package:airplane_bloc/blocs/destination/destination_bloc.dart';
import 'package:airplane_bloc/models/destination_model.dart';
import 'package:airplane_bloc/shared/theme.dart';
import 'package:airplane_bloc/ui/widgets/destination_card.dart';
import 'package:airplane_bloc/ui/widgets/destination_tile.dart';
import 'package:airplane_bloc/utils/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _getProfile();
    context.read<DestinationBloc>().add(FectchDestinationEvent());
    super.initState();
  }

  void _getProfile() {
    final String uid = context.read<AuthBloc>().state.user!.uid;
    print('uid: $uid');
    context.read<ProfileBloc>().add(GetProfileEvent(uid: uid));
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.profileStatus == ProfileStatus.error) {
            errorDialog(context, state.error);
          }
        },
        builder: (context, state) {
          if (state.profileStatus == ProfileStatus.initial) {
            return Container();
          } else if (state.profileStatus == ProfileStatus.loading) {
            return CircularProgressIndicator();
          } else if (state.profileStatus == ProfileStatus.error) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/error.png',
                    width: 75,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Oooops!\nTry again',
                    textAlign: TextAlign.center,
                    style: redTextSyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              margin: const EdgeInsets.only(
                left: 24,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\n${state.user.name}',
                          style: blackTextSyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'Where to fly today?',
                          style: greyTextSyle.copyWith(
                            fontSize: 16,
                            fontWeight: ligth,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    margin: const EdgeInsets.only(
                      right: 24,
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/image_profile.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      );
    }

    Widget popularDestinations(List<DestinationModel> destinations) {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations.map((DestinationModel destination) {
              return DestinationCard(
                destination: destination,
              );
            }).toList(),
          ),
        ),
      );
    }

    Widget newDestinations(List<DestinationModel> destinations) {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextSyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Column(
              children: destinations.map((DestinationModel destination) {
                return DestinationTile(destination: destination);
              }).toList(),
            ),
          ],
        ),
      );
    }

    return BlocConsumer<DestinationBloc, DestinationState>(
      listener: (context, state) {
        if (state.destinationStatus == DestinationStatus.error) {
          errorDialog(context, state.error);
        }
      },
      builder: (context, state) {
        if (state.destinationStatus == DestinationStatus.succes) {
          return Scaffold(
            backgroundColor: kBackgroundColor,
            body: SafeArea(
              child: ListView(
                children: [
                  header(),
                  popularDestinations(state.destinations!),
                  newDestinations(state.destinations!),
                ],
              ),
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
