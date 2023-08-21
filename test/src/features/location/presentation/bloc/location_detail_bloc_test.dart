import 'package:bloc_test/bloc_test.dart';
import 'package:rickandmorty_app/src/features/location/domain/usecases/locations_usecase.dart';
import 'package:rickandmorty_app/src/features/location/presentation/bloc/location_detail_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/core/errors_mocks.dart';
import '../../../../../mocks/location/locations_mocks.dart';

class _MockLocationsUsecase extends Mock implements LocationsUsecase {}

void main() {
  late LocationDetailBloc locationDetailBloc;
  late LocationsUsecase locationsUsecase;

  setUp(() {
    locationsUsecase = _MockLocationsUsecase();
    locationDetailBloc = LocationDetailBloc(locationsUsecase);
  });

  void successMock() {
    when(
      () => locationsUsecase.getLocationById(
        id: LocationsMocks.locationDetail.id,
      ),
    ).thenAnswer((_) async => Right(LocationsMocks.locationDetail));
  }

  void errorMock() {
    when(
      () => locationsUsecase.getLocationById(
        id: LocationsMocks.locationDetail.id,
      ),
    ).thenAnswer((_) async => Left(ErrorsMocks.rickandmortyFailure));
  }

  group('LocationDetailBloc tests', () {
    blocTest<LocationDetailBloc, LocationDetailState>(
      'Should change state to SuccessfulLocationDetailState with correctly LocationDetail',
      build: () {
        successMock();

        return locationDetailBloc;
      },
      act: (locationDetailBloc) {
        locationDetailBloc.add(
          GetDataOnLocationDetailEvent(LocationsMocks.locationDetail.id),
        );
      },
      expect: () => <LocationDetailState>[
        LoadingLocationDetailState(),
        SuccessfulLocationDetailState(LocationsMocks.locationDetail)
      ],
    );

    blocTest<LocationDetailBloc, LocationDetailState>(
      'Should change state to UnSuccessfulLocationDetailState with RickandmortyFailure.message',
      build: () {
        errorMock();
        return locationDetailBloc;
      },
      act: (locationDetailBloc) {
        locationDetailBloc.add(
          GetDataOnLocationDetailEvent(LocationsMocks.locationDetail.id),
        );
      },
      expect: () => <LocationDetailState>[
        LoadingLocationDetailState(),
        const UnSuccessfulLocationDetailState(ErrorsMocks.errorMessage),
      ],
    );
  });
}
