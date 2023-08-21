import 'package:http/http.dart';

abstract class RickandmortyInterceptor {
  Future<void> onRequest(BaseRequest request) async {}

  Future<void> onResponse(
    StreamedResponse response,
    BaseRequest request,
  ) async {}

  Future<void> onError(
    Response error,
    BaseRequest request,
    Client client,
  ) async {}
}
