import 'package:rickandmorty_app/src/core/http_client/rickandmorty_http_client.dart';
import 'package:rickandmorty_app/src/core/http_client/interceptors/check_connection_interceptor.dart';
import 'package:get_it/get_it.dart';

sealed class RickandmortyHttpInject {
  static void configure(GetIt getIt) {
    getIt.registerLazySingleton<CheckConnectionInterceptor>(
      CheckConnectionInterceptor.new,
    );

    final httpClient = RickandmortyClient();
    httpClient.addInterceptor([getIt<CheckConnectionInterceptor>()]);
    getIt.registerLazySingleton<RickandmortyClient>(
      () => httpClient,
    );
  }
}
