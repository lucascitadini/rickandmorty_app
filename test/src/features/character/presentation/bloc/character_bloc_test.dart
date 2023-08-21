import 'package:bloc_test/bloc_test.dart';
import 'package:rickandmorty_app/src/features/character/domain/usecases/characters_usecase.dart';
import 'package:rickandmorty_app/src/features/character/presentation/bloc/character_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/character/characters_mocks.dart';
import '../../../../../mocks/core/errors_mocks.dart';

class _MockCharactersUsecase extends Mock implements CharactersUsecase {}

void main() {
  late CharacterBloc characterBloc;
  late CharactersUsecase characterUsecase;

  setUp(() {
    characterUsecase = _MockCharactersUsecase();
    characterBloc = CharacterBloc(characterUsecase);
  });

  void successMockWithOutUrl() {
    when(
      () => characterUsecase.getCharacters(),
    ).thenAnswer((_) async => Right(CharactersMocks.characterList));
  }

  void successMockWithUrl() {
    when(
      () => characterUsecase.getCharacters(
        urlPage: CharactersMocks.getCharactersUrlBase,
      ),
    ).thenAnswer((_) async => Right(CharactersMocks.characterList));
  }

  void errorMockWithOutUrl() {
    when(
      () => characterUsecase.getCharacters(),
    ).thenAnswer((_) async => Left(ErrorsMocks.rickandmortyFailure));
  }

  void errorMockWithUrl() {
    when(
      () => characterUsecase.getCharacters(
        urlPage: CharactersMocks.getCharactersUrlBase,
      ),
    ).thenAnswer((_) async => Left(ErrorsMocks.rickandmortyFailure));
  }

  void successPageStateMock() {
    characterBloc.emit(
      SuccessfulCharacterPageState(
        CharactersMocks.characters,
        CharactersMocks.info,
      ),
    );
  }

  group('CharacterBloc tests', () {
    blocTest<CharacterBloc, CharacterState>(
      'Should change state to SuccessfulCharacterPageState with correctly CharacterList',
      build: () {
        successMockWithOutUrl();

        return characterBloc;
      },
      act: (characterBloc) {
        characterBloc.add(const GetDataOnCharacterEvent());
      },
      expect: () => <CharacterState>[
        LoadingCharacterState(),
        SuccessfulCharacterPageState(
          CharactersMocks.characters,
          CharactersMocks.info,
        )
      ],
    );

    blocTest<CharacterBloc, CharacterState>(
      'Should change state to CharacterPageState with correctly CharacterList',
      build: () {
        successMockWithUrl();
        successPageStateMock();
        return characterBloc;
      },
      act: (characterBloc) {
        characterBloc.add(
          const GetDataOnCharacterEvent(
            urlPage: CharactersMocks.getCharactersUrlBase,
          ),
        );
      },
      expect: () => <CharacterState>[
        LoadingCharacterPageState(
          CharactersMocks.characters,
          CharactersMocks.info,
        ),
        SuccessfulCharacterPageState(
          CharactersMocks.twiceCharacters,
          CharactersMocks.info,
        ),
      ],
    );

    blocTest<CharacterBloc, CharacterState>(
      'Should change state to UnSuccessfulCharacterState with RickandmortyFailure.message',
      build: () {
        errorMockWithOutUrl();
        return characterBloc;
      },
      act: (characterBloc) {
        characterBloc.add(
          const GetDataOnCharacterEvent(),
        );
      },
      expect: () => <CharacterState>[
        LoadingCharacterState(),
        UnSuccessfulCharacterState(
          ErrorsMocks.errorMessage,
        ),
      ],
    );

    blocTest<CharacterBloc, CharacterState>(
      'Should change state to UnSuccessfulCharacterPageState with RickandmortyFailure.message',
      build: () {
        errorMockWithUrl();
        successPageStateMock();
        return characterBloc;
      },
      act: (characterBloc) {
        characterBloc.add(
          const GetDataOnCharacterEvent(
            urlPage: CharactersMocks.getCharactersUrlBase,
          ),
        );
      },
      expect: () => <CharacterState>[
        LoadingCharacterPageState(
          CharactersMocks.characters,
          CharactersMocks.info,
        ),
        UnSuccessfulCharacterPageState(
          CharactersMocks.characters,
          CharactersMocks.info,
          ErrorsMocks.errorMessage,
        ),
      ],
    );
  });
}
