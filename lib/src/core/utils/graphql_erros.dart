import 'package:graphql/client.dart';

sealed class GraphqlBuildErrorMessage {
  static String? fromGraphQLQueryResult(QueryResult result) {
    if (!result.hasException) {
      return null;
    }
    final graphqlErrors = result.exception!.graphqlErrors;

    String errorBuilder = '';

    for (final error in graphqlErrors) {
      errorBuilder += '${error.message}\n';
    }

    if (errorBuilder.isEmpty) {
      errorBuilder = 'An error occurred';
    }
    return errorBuilder;
  }
}