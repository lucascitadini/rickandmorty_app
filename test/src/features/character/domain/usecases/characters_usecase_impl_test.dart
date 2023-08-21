import 'package:rickandmorty_app/src/features/character/data/models/character_list.dart';
import 'package:rickandmorty_app/src/features/character/data/repository/characters_repository.dart';
import 'package:rickandmorty_app/src/features/character/domain/usecases/characters_usecase.dart';
import 'package:rickandmorty_app/src/features/character/domain/usecases/characters_usecase_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/character/characters_mocks.dart';
import '../../../../../mocks/core/errors_mocks.dart';

class _MockCharactersRepository extends Mock implements CharactersRepository {}

void main() {
  late CharactersRepository charactersRepository;
  late CharactersUsecase charactersUsecase;

  setUp(() async {
    charactersRepository = _MockCharactersRepository();
    charactersUsecase = CharactersUsecaseImpl(repository: charactersRepository);
  });

  When<Future<CharacterList>> whenCharactersRepository() => when(
        () => charactersRepository
            .getCharacters(CharactersMocks.getCharactersUrlBase),
      );

  test('should return a list of banks entity', () async {
    whenCharactersRepository()
        .thenAnswer((_) async => CharactersMocks.characterList);

    final result = await charactersUsecase.getCharacters(
      urlPage: CharactersMocks.getCharactersUrlBase,
    );
    expect(result, Right(CharactersMocks.characterList));
    verify(
      (() => charactersRepository
          .getCharacters(CharactersMocks.getCharactersUrlBase)),
    ).called(1);
    verifyNoMoreInteractions(charactersRepository);
  });

  test('should return a failure when usecase returns a failure', () async {
    whenCharactersRepository().thenThrow(ErrorsMocks.rickandmortyException);
    final result = await charactersUsecase.getCharacters(
      urlPage: CharactersMocks.getCharactersUrlBase,
    );
    expect(result, Left(ErrorsMocks.rickandmortyFailure));
  });
}
