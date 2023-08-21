import 'dart:io';

import 'package:rickandmorty_app/src/core/errors/broken_connection_exception.dart';
import 'package:rickandmorty_app/src/core/http_client/interceptors/rickandmorty_interceptor.dart';
import 'package:http/http.dart';

final class CheckConnectionInterceptor extends RickandmortyInterceptor {
  @override
  Future<void> onRequest(BaseRequest request) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return;
      } else {
        throw BrokenConnectionException(
          message: 'Error During Communication: No Internet connection.',
          error: null,
        );
      }
    } on SocketException catch (_) {
      throw BrokenConnectionException(
        message: 'Error During Communication: No Internet connection.',
        error: null,
      );
    }
  }
}
