import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:path_provider/path_provider.dart';

sealed class GraphQLInject {
  static Future<void> configure(GetIt getIt) async {
    final store = await HiveStore.open(
      path: (await getApplicationDocumentsDirectory()).path,
    );
    getIt.registerLazySingleton<GraphQLClient>(
      () => GraphQLClient(
        link: HttpLink('https://rickandmortyapi.com/graphql'),
        cache: GraphQLCache(store: store),
      ),
    );
  }
}
