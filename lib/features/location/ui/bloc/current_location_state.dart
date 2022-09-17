part of 'current_location_bloc.dart';

@freezed
class CurrentLocationState with _$CurrentLocationState {
  const factory CurrentLocationState.initial() = _Initial;

  const factory CurrentLocationState.loading() = _Loading;

  const factory CurrentLocationState.userLocation(Position position) = _UserLocation;

  const factory CurrentLocationState.failed(Failure failure) = _Failed;
}
