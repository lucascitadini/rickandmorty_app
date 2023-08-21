part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  @override
  List<Object> get props => [];
}

final class InitialLocationState extends LocationState {}

final class LoadingLocationState extends LocationState {}

final class UnSuccessfulLocationState extends LocationState {
  final String errorMessage;

  UnSuccessfulLocationState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

abstract class LocationPageState extends LocationState {
  final List<Location> locations;
  final PageInfo info;
  LocationPageState(this.locations, this.info);

  bool get hasNextPage => info.next != null;

  @override
  List<Object> get props => [locations, info];
}

final class SuccessfulLocationPageState extends LocationPageState {
  SuccessfulLocationPageState(List<Location> locations, PageInfo info) 
    : super(locations, info);
}

final class UnSuccessfulLocationPageState extends LocationPageState {
  final String errorMessage;
  UnSuccessfulLocationPageState(List<Location> locations, PageInfo info,
     this.errorMessage,) : super(locations, info);

  @override
  List<Object> get props => [super.props, errorMessage];
}

final class LoadingLocationPageState extends LocationPageState {
  LoadingLocationPageState(List<Location> locations, PageInfo info) : super(locations, info);
}