import 'package:rickandmorty_app/src/core/errors/rickandmorty_failure.dart';
import 'package:rickandmorty_app/src/features/character/data/models/index.dart';
import 'package:dartz/dartz.dart';

abstract class CharactersUsecase {
  Future<Either<RickandmortyFailure, CharacterList>> getCharacters(
      {String? urlPage});
}
