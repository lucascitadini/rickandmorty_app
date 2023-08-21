import 'package:rickandmorty_app/src/core/errors/rickandmorty_exception.dart';
import 'package:rickandmorty_app/src/core/errors/rickandmorty_failure.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location_detail.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location_list.dart';
import 'package:rickandmorty_app/src/features/location/data/repository/locations_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:rickandmorty_app/src/features/location/domain/usecases/locations_usecase.dart';

class LocationsUsecaseImpl extends LocationsUsecase {
  final LocationsRepository _repository;
  LocationsUsecaseImpl({
    required LocationsRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<RickandmortyFailure, LocationList>> getLocations({
    int page = 1,
  }) async {
    try {
      final result = await _repository.getLocations(page: page);
      return Right(result);
    } on RickandmortyException catch (e) {
      return Left(RickandmortyFailure(message: e.message));
    }
  }

  @override
  Future<Either<RickandmortyFailure, LocationDetail>> getLocationById({
    required String id,
  }) async {
    try {
      final result = await _repository.getLocationById(id: id);
      return Right(result);
    } on RickandmortyException catch (e) {
      return Left(RickandmortyFailure(message: e.message));
    }
  }
}
