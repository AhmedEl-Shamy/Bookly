part of 'recommendation_books_cubit.dart';

sealed class RecommendationBooksState{
  const RecommendationBooksState();
}

final class RecommendationBooksInitial extends RecommendationBooksState {}

final class RecommendationBooksSuccess extends RecommendationBooksState {
  final List<BookEntity> books;

  const RecommendationBooksSuccess({required this.books});
}

final class RecommendationBooksFaild extends RecommendationBooksState {
  final Failure failure;

  const RecommendationBooksFaild({required this.failure});
}
final class RecommendationBooksLoading extends RecommendationBooksState {}
final class RecommendationBooksPaginationField extends RecommendationBooksState {
  final Failure failure;

  RecommendationBooksPaginationField({required this.failure});

}
