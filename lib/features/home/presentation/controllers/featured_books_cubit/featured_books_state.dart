part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState{
  const FeaturedBooksState();
}

final class FeaturedBooksInitial extends FeaturedBooksState {}
final class FeaturedBooksLoading extends FeaturedBooksState {}
final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;
  const FeaturedBooksSuccess(this.books);
}
final class FeaturedBooksFailed extends FeaturedBooksState {
  final Failure failure;
  const FeaturedBooksFailed(this.failure);
}
