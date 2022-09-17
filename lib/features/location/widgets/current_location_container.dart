import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/common/widgets/failure_view.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/location/bloc/current_location_bloc.dart';
import 'package:weather_app/core/common/widgets/progress_view.dart';


class CurrentLocationContainer extends StatelessWidget {
  const CurrentLocationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CurrentLocationBloc.fromContext(context)..loadUserLocation(),
      child: Builder(
        builder: (BuildContext context) => _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return BlocBuilder<CurrentLocationBloc, CurrentLocationState>(
      builder: (BuildContext context, CurrentLocationState state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const ProgressView(),
          userLocation: (Position position) => _buildUserLocation(
            context,
            position,
          ),
          failed: (Failure failure) => Center(child: FailureView(failure: failure)),
        );
      },
    );
  }

  Widget _buildUserLocation(BuildContext context, Position position) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current location:',
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 16),
          // TODO: add widget for positional weather based on position.
        ],
      ),
    );
  }
}
