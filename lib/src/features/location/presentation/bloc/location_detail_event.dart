part of 'location_detail_bloc.dart';

abstract class LocationDetailEvent extends Equatable {
  const LocationDetailEvent();

  @override
  List<Object> get props => [];
}

class GetDataOnLocationDetailEvent extends LocationDetailEvent {
  final String id;

  const GetDataOnLocationDetailEvent(this.id);

  @override
  List<Object> get props => [id];
}
