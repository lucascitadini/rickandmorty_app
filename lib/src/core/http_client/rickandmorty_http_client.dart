import 'package:rickandmorty_app/src/core/http_client/interceptors/rickandmorty_interceptor.dart';
import 'package:http/http.dart';

final class RickandmortyClient extends BaseClient {
  final List<RickandmortyInterceptor> _interceptors = [];

  void addInterceptor(List<RickandmortyInterceptor> interceptor) {
    _interceptors.addAll(interceptor);
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    for (final interceptor in _interceptors) {
      await interceptor.onRequest(request);
    }

    return request.send();
  }
}
