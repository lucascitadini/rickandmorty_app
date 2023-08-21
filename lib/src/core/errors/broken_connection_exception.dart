import 'dart:developer';

import 'package:http/http.dart';

final class BrokenConnectionException extends ClientException {
  final Object? error;
  BrokenConnectionException({
    required String message,
    required this.error,
  }) : super(message) {
    log('$message - $error');
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is BrokenConnectionException &&
        other.message == message &&
        other.error == error;
  }

  @override
  int get hashCode {
    return message.hashCode ^ error.hashCode;
  }
}