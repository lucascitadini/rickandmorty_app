import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rickandmorty_app/src/core/errors/rickandmorty_failure.dart';
import 'package:rickandmorty_app/src/features/character/data/models/index.dart';
import 'package:rickandmorty_app/src/features/character/domain/usecases/characters_usecase.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharactersUsecase _charactersUsecase;

  CharacterBloc(
    this._charactersUsecase,
  ) : super(InitialCharacterState()) {
    on<GetDataOnCharacterEvent>(
      _getDataOnCharactersPage,
    );
    on<DataLoadedOnCharacterEvent>(
      _dataLoadedOnCharactersPage,
    );
    on<LoadingDataOnCharacterEvent>(
      (event, emitter) => emitter(LoadingCharacterState()),
    );
    on<LoadingPageDataOnCharacterEvent>(
      (event, emitter) => _loadingDataCharactersPage(emitter),
    );
    on<ErrorDataLoadedOnCharacterEvent>(
      _errorDataLoadedOnCharactersPage,
    );
  }

  Future<void> _loadingDataCharactersPage(
    Emitter<CharacterState> emit,
  ) async {
    if (state is CharacterPageState) {
      final characterPageState = state as CharacterPageState;
      emit(
        LoadingCharacterPageState(
          characterPageState.characters,
          characterPageState.info,
        ),
      );
    } else {
      emit(LoadingCharacterState());
    }
  }

  Future<void> _errorDataLoadedOnCharactersPage(
    ErrorDataLoadedOnCharacterEvent event,
    Emitter<CharacterState> emit,
  ) async {
    if (state is CharacterPageState) {
      final actualCharacterList = (state as CharacterPageState).characters;
      emit(
        UnSuccessfulCharacterPageState(
          actualCharacterList,
          (state as CharacterPageState).info,
          event.failure.message,
        ),
      );
    } else {
      emit(UnSuccessfulCharacterState(event.failure.message));
    }
  }

  Future<void> _dataLoadedOnCharactersPage(
    DataLoadedOnCharacterEvent event,
    Emitter<CharacterState> emit,
  ) async {
    if (state is CharacterPageState) {
      emit(
        SuccessfulCharacterPageState(
          List<Character>.from((state as CharacterPageState).characters)
            ..addAll(event.characterList!.results),
          event.characterList!.info,
        ),
      );
    } else {
      emit(
        SuccessfulCharacterPageState(
          event.characterList!.results,
          event.characterList!.info,
        ),
      );
    }
  }

  Future<void> _getDataOnCharactersPage(
    GetDataOnCharacterEvent event,
    Emitter<CharacterState> emit,
  ) async {
    if (event.urlPage != null) {
      add(LoadingPageDataOnCharacterEvent());
    } else {
      add(LoadingDataOnCharacterEvent());
    }
    final result =
        await _charactersUsecase.getCharacters(urlPage: event.urlPage);
    result.fold(
      (error) => add(ErrorDataLoadedOnCharacterEvent(error)),
      (characterList) => add(DataLoadedOnCharacterEvent(characterList)),
    );
  }
}
