part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class GetDataOnLocationEvent extends LocationEvent {
  final int? page;

  const GetDataOnLocationEvent({this.page});

  @override
  List<Object?> get props => [page];
}

class LoadingDataOnLocationEvent extends LocationEvent {}

class LoadingPageDataOnLocationEvent extends LocationEvent {}

class DataLoadedOnLocationEvent extends LocationEvent {
  final LocationList? locationList;

  const DataLoadedOnLocationEvent(this.locationList);

  @override
  List<Object?> get props => [locationList];
}

class ErrorDataLoadedOnLocationEvent extends LocationEvent {
  final RickandmortyFailure failure;

  const ErrorDataLoadedOnLocationEvent(this.failure);

  @override
  List<Object?> get props => [failure];
}
