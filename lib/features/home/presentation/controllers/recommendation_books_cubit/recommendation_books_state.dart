part of 'recommendation_books_cubit.dart';

sealed class RecommendationBooksState extends Equatable {
  const RecommendationBooksState();

  @override
  List<Object> get props => [];
}

final class RecommendationBooksInitial extends RecommendationBooksState {}

final class RecommendationBooksSuccess extends RecommendationBooksState {
  final List<BookModel> books;

  const RecommendationBooksSuccess({required this.books});
}

final class RecommendationBooksFaild extends RecommendationBooksState {
  final Failure failure;

  const RecommendationBooksFaild({required this.failure});
}

final class RecommendationBooksLoading extends RecommendationBooksState {}
