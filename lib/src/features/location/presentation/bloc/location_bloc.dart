import 'package:rickandmorty_app/src/core/errors/rickandmorty_failure.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location_list.dart';
import 'package:rickandmorty_app/src/features/location/data/models/page_info.dart';
import 'package:rickandmorty_app/src/features/location/domain/usecases/locations_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationsUsecase _locationsUsecase;

  LocationBloc(
    this._locationsUsecase,
  ) : super(InitialLocationState()) {
    on<GetDataOnLocationEvent>(
      _getDataOnLocationsPage,
    );
    on<DataLoadedOnLocationEvent>(
      _dataLoadedOnLocationsPage,
    );
    on<LoadingDataOnLocationEvent>(
      (event, emitter) => emitter(LoadingLocationState()),
    );
    on<LoadingPageDataOnLocationEvent>(
      (event, emitter) => _loadingDataLocationsPage(emitter),
    );
    on<ErrorDataLoadedOnLocationEvent>(
      _errorDataLoadedOnLocationsPage,
    );
  }

  Future<void> _loadingDataLocationsPage(
    Emitter<LocationState> emit,
  ) async {
    if (state is LocationPageState) {
      final characterPageState = state as LocationPageState;
      emit(
        LoadingLocationPageState(
          characterPageState.locations,
          characterPageState.info,
        ),
      );
    } else {
      emit(LoadingLocationState());
    }
  }

  Future<void> _errorDataLoadedOnLocationsPage(
    ErrorDataLoadedOnLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    if (state is LocationPageState) {
      final actualCharacterList = (state as LocationPageState).locations;
      emit(
        UnSuccessfulLocationPageState(
          actualCharacterList,
          (state as LocationPageState).info,
          event.failure.message,
        ),
      );
    } else {
      emit(UnSuccessfulLocationState(event.failure.message));
    }
  }

  Future<void> _dataLoadedOnLocationsPage(
    DataLoadedOnLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    if (state is LocationPageState) {
      emit(
        SuccessfulLocationPageState(
          List<Location>.from((state as LocationPageState).locations)
            ..addAll(event.locationList!.results),
          event.locationList!.info,
        ),
      );
    } else {
      emit(
        SuccessfulLocationPageState(
          event.locationList!.results,
          event.locationList!.info,
        ),
      );
    }
  }

  Future<void> _getDataOnLocationsPage(
    GetDataOnLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    if (event.page != null) {
      add(LoadingPageDataOnLocationEvent());
    } else {
      add(LoadingDataOnLocationEvent());
    }
    final result = await _locationsUsecase.getLocations(page: event.page ?? 1);
    result.fold(
      (error) => add(ErrorDataLoadedOnLocationEvent(error)),
      (characterList) => add(DataLoadedOnLocationEvent(characterList)),
    );
  }
}
