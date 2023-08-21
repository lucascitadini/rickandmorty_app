import 'package:get_it/get_it.dart';

import 'package:rickandmorty_app/src/core/http_client/rickandmorty_http_client.dart';
import 'package:rickandmorty_app/src/features/character/data/repository/characters_repository.dart';
import 'package:rickandmorty_app/src/features/character/data/repository/characters_repository_impl.dart';
import 'package:rickandmorty_app/src/features/character/domain/usecases/characters_usecase.dart';
import 'package:rickandmorty_app/src/features/character/domain/usecases/characters_usecase_impl.dart';

sealed class CharactersInject {
  static void configure(GetIt getIt) {
    getIt.registerFactory<CharactersRepository>(
      () => CharactersRepositoryImpl(getIt<RickandmortyClient>()),
    );
    getIt.registerFactory<CharactersUsecase>(
      () => CharactersUsecaseImpl(repository: getIt<CharactersRepository>()),
    );
  }
}
