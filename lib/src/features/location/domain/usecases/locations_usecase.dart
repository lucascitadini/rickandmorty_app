import 'package:rickandmorty_app/src/core/errors/rickandmorty_failure.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location_detail.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location_list.dart';
import 'package:dartz/dartz.dart';

abstract class LocationsUsecase {
  Future<Either<RickandmortyFailure, LocationList>> getLocations(
      {int page = 1});
  Future<Either<RickandmortyFailure, LocationDetail>> getLocationById({
    required String id,
  });
}
