class Either<E, T> {
  final E? error;
  final T? data;
  Either({this.error, this.data});
  E? getError() => error;
  T? getData() => data;

  void fold({
    required void Function(E) errorFunction,
    required void Function(T) successFunction,
  }) {
    if (error != null) {
      errorFunction.call(error as E);
    } else if (data != null) {
      successFunction.call(data as T);
    }
  }
}
