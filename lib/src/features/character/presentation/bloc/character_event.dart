part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object?> get props => [];
}

class GetDataOnCharacterEvent extends CharacterEvent {
  final String? urlPage;

  const GetDataOnCharacterEvent({this.urlPage});

  @override
  List<Object?> get props => [urlPage];
}

class LoadingDataOnCharacterEvent extends CharacterEvent {}

class LoadingPageDataOnCharacterEvent extends CharacterEvent {}

class DataLoadedOnCharacterEvent extends CharacterEvent {
  final CharacterList? characterList;

  const DataLoadedOnCharacterEvent(this.characterList);

  @override
  List<Object?> get props => [characterList];
}

class ErrorDataLoadedOnCharacterEvent extends CharacterEvent {
  final RickandmortyFailure failure;

  const ErrorDataLoadedOnCharacterEvent(this.failure);

  @override
  List<Object?> get props => [failure];
}
