import 'package:bloc/bloc.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location_detail.dart';
import 'package:rickandmorty_app/src/features/location/domain/usecases/locations_usecase.dart';
import 'package:equatable/equatable.dart';

part 'location_detail_event.dart';
part 'location_detail_state.dart';

class LocationDetailBloc
    extends Bloc<LocationDetailEvent, LocationDetailState> {
  final LocationsUsecase _locationsUsecase;
  LocationDetailBloc(this._locationsUsecase)
      : super(InitialLocationDetailState()) {
    on<GetDataOnLocationDetailEvent>(
      _getDataOnLocationDetailPage,
    );
  }

  Future<void> _getDataOnLocationDetailPage(
    GetDataOnLocationDetailEvent event,
    Emitter<LocationDetailState> emit,
  ) async {
    emit(LoadingLocationDetailState());
    final result = await _locationsUsecase.getLocationById(id: event.id);
    result.fold(
      (error) => emit(UnSuccessfulLocationDetailState(error.message)),
      (locationDetail) => emit(SuccessfulLocationDetailState(locationDetail)),
    );
  }
}
