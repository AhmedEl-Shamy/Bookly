class Either<E, T> {
  final E? error;
  final T? data;
  Either({this.error, this.data});
  E? getError() => error;
  T? getData() => data;
}