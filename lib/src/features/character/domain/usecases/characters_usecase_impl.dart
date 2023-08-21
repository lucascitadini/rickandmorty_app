import 'package:dartz/dartz.dart';

import 'package:rickandmorty_app/src/core/errors/rickandmorty_exception.dart';
import 'package:rickandmorty_app/src/core/errors/rickandmorty_failure.dart';
import 'package:rickandmorty_app/src/features/character/data/models/index.dart';
import 'package:rickandmorty_app/src/features/character/data/repository/characters_repository.dart';
import 'package:rickandmorty_app/src/features/character/domain/usecases/characters_usecase.dart';

class CharactersUsecaseImpl extends CharactersUsecase {
  final CharactersRepository _repository;
  CharactersUsecaseImpl({
    required CharactersRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<RickandmortyFailure, CharacterList>> getCharacters({
    String? urlPage,
  }) async {
    try {
      final result = await _repository.getCharacters(urlPage);
      return Right(result);
    } on RickandmortyException catch (e) {
      return Left(RickandmortyFailure(message: e.message));
    }
  }
}
