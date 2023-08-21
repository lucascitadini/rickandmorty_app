part of 'character_bloc.dart';

sealed class CharacterState extends Equatable {
  @override
  List<Object> get props => [];
}

final class InitialCharacterState extends CharacterState {}

final class LoadingCharacterState extends CharacterState {}

final class UnSuccessfulCharacterState extends CharacterState {
  final String errorMessage;

  UnSuccessfulCharacterState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

abstract class CharacterPageState extends CharacterState {
  final List<Character> characters;
  final Info info;
  CharacterPageState(this.characters, this.info);

  bool get hasNextPage => info.next != null;

  @override
  List<Object> get props => [characters, info];
}

final class SuccessfulCharacterPageState extends CharacterPageState {
  SuccessfulCharacterPageState(List<Character> characters, Info info) 
    : super(characters, info);
}

final class UnSuccessfulCharacterPageState extends CharacterPageState {
  final String errorMessage;
  UnSuccessfulCharacterPageState(List<Character> characters, Info info,
     this.errorMessage,) : super(characters, info);

  @override
  List<Object> get props => [super.props, errorMessage];
}

final class LoadingCharacterPageState extends CharacterPageState {
  LoadingCharacterPageState(List<Character> characters, Info info) : super(characters, info);
}