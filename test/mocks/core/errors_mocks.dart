import 'package:rickandmorty_app/src/core/errors/rickandmorty_exception.dart';
import 'package:rickandmorty_app/src/core/errors/rickandmorty_failure.dart';

class ErrorsMocks {
  ErrorsMocks._();

  static const errorMessage = 'Unexpected error';
  static final rickandmortyException =
      RickandmortyException(message: errorMessage, error: errorMessage);
  static final rickandmortyFailure = RickandmortyFailure(message: errorMessage);
}
