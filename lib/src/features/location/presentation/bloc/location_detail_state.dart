part of 'location_detail_bloc.dart';

sealed class LocationDetailState extends Equatable {
  const LocationDetailState();
  
  @override
  List<Object> get props => [];
}

final class InitialLocationDetailState extends LocationDetailState {}

final class LoadingLocationDetailState extends LocationDetailState {}

final class UnSuccessfulLocationDetailState extends LocationDetailState {
  final String errorMessage;

  const UnSuccessfulLocationDetailState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class SuccessfulLocationDetailState extends LocationDetailState {
  final LocationDetail location;

  const SuccessfulLocationDetailState(this.location);

  @override
  List<Object> get props => [location];
}
