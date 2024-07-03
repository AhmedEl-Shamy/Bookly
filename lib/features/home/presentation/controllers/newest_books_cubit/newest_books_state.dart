part of 'newest_books_cubit.dart';

sealed class NewestBooksState{
  const NewestBooksState();
}

final class NewestBooksInitial extends NewestBooksState {}
final class NewestBooksLoading extends NewestBooksState {}
final class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;
  const NewestBooksSuccess(this.books);
}
final class NewestBooksFailed extends NewestBooksState {
  final Failure failure;
  const NewestBooksFailed(this.failure);
}
