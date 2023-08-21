import 'dart:developer';

final class RickandmortyException implements Exception {
  final String message;
  final Object? error;
  RickandmortyException({
    required this.message,
    required this.error,
  }) {
    log('$message - $error');
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is RickandmortyException &&
        other.message == message &&
        other.error == error;
  }

  @override
  int get hashCode {
    return message.hashCode ^ error.hashCode;
  }
}
