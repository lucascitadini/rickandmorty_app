import 'package:rickandmorty_app/src/features/location/data/repository/locations_repository.dart';
import 'package:rickandmorty_app/src/features/location/data/repository/locations_repository_impl.dart';
import 'package:rickandmorty_app/src/features/location/domain/usecases/locations_usecase.dart';
import 'package:rickandmorty_app/src/features/location/domain/usecases/locations_usecase_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

sealed class LocationsInject {
  static void configure(GetIt getIt) {
    getIt.registerFactory<LocationsRepository>(
      () => LocationsRepositoryImpl(getIt<GraphQLClient>()),
    );
    getIt.registerFactory<LocationsUsecase>(
      () => LocationsUsecaseImpl(repository: getIt<LocationsRepository>()),
    );
  }
}
