import 'package:rickandmorty_app/src/core/errors/rickandmorty_exception.dart';
import 'package:rickandmorty_app/src/features/character/data/models/character_list.dart';
import 'package:rickandmorty_app/src/features/character/data/repository/characters_repository.dart';
import 'package:rickandmorty_app/src/features/character/data/repository/characters_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../mocks/character/characters_mocks.dart';

class _MockHttpClient extends Mock implements Client {}

void main() {
  late Client client;
  late CharactersRepository repository;

  setUp(() async {
    client = _MockHttpClient();
    repository = CharactersRepositoryImpl(client);
  });

  When<Future<Response>> whenHttpClient() => when(
        () => client.get(
          Uri.parse(CharactersMocks.getCharactersUrlBase),
          headers: any(named: 'headers'),
        ),
      );

  test('call should return a CharacterList when success', () async {
    whenHttpClient().thenAnswer(
      (invocation) async => Response(
        CharactersMocks.getCharactersJson,
        200,
      ),
    );

    final result =
        await repository.getCharacters(CharactersMocks.getCharactersUrlBase);

    expect(result, isA<CharacterList>());
  });

  test('call should rethrow any RickandmortyException with ClientException',
      () {
    whenHttpClient().thenThrow(ClientException('Error'));

    final result =
        repository.getCharacters(CharactersMocks.getCharactersUrlBase);

    expect(result, throwsA(isA<RickandmortyException>()));
  });

  test('call should rethrow any RickandmortyException with Exception', () {
    whenHttpClient().thenThrow(Exception('error'));

    final result =
        repository.getCharacters(CharactersMocks.getCharactersUrlBase);

    expect(result, throwsA(isA<RickandmortyException>()));
  });
}
