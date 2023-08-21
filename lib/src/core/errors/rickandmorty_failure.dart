class RickandmortyFailure {
  final String message;
  RickandmortyFailure({required this.message});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is RickandmortyFailure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
