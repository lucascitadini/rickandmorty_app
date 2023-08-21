import 'dart:async';
import 'package:rickandmorty_app/src/core/utils/graphql_erros.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location_detail.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location_list.dart';
import 'package:graphql/client.dart';

import 'package:rickandmorty_app/src/core/errors/rickandmorty_exception.dart';

import 'package:rickandmorty_app/src/features/location/data/repository/location_queries_text.dart';
import 'package:rickandmorty_app/src/features/location/data/repository/locations_repository.dart';

class LocationsRepositoryImpl implements LocationsRepository {
  final GraphQLClient client;

  LocationsRepositoryImpl(this.client);

  @override
  Future<LocationList> getLocations({int page = 1}) async {
    try {
      final options = QueryOptions(
        document: gql(LocationQueriesText.locationsQueryString),
        variables: {
          'page': page,
        },
        parserFn: (data) {
          return LocationList.fromJson(
            data['locations'] as Map<String, dynamic>,
          );
        },
      );
      final result = await client.query<LocationList>(options);
      if (result.hasException) {
        throw RickandmortyException(
          error: result.exception,
          message: GraphqlBuildErrorMessage.fromGraphQLQueryResult(result)!,
        );
      }
      return Future.value(
        result.parserFn(result.data!),
      );
    } catch (exception) {
      throw RickandmortyException(
          error: exception, message: 'Unexpected error');
    }
  }

  @override
  Future<LocationDetail> getLocationById({required String id}) async {
    try {
      final options = QueryOptions(
        document: gql(LocationQueriesText.locationById),
        variables: {
          'id': id,
        },
        parserFn: (data) {
          return LocationDetail.fromJson(
            data['location'] as Map<String, dynamic>,
          );
        },
      );
      final result = await client.query<LocationDetail>(options);
      if (result.hasException) {
        throw RickandmortyException(
          error: result.exception,
          message: GraphqlBuildErrorMessage.fromGraphQLQueryResult(result)!,
        );
      }
      return Future.value(
        result.parserFn(result.data!),
      );
    } catch (exception) {
      throw RickandmortyException(
          error: exception, message: 'Unexpected error');
    }
  }
}
