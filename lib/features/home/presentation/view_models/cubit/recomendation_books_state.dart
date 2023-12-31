part of 'recomendation_books_cubit.dart';

sealed class RecomendationBooksState extends Equatable {
  const RecomendationBooksState();

  @override
  List<Object> get props => [];
}

final class RecomendationBooksInitial extends RecomendationBooksState {}

final class RecomendationBooksSuccess extends RecomendationBooksState {
  final List<BookModel> books;

  const RecomendationBooksSuccess({required this.books});
}

final class RecomendationBooksFaild extends RecomendationBooksState {
  final Failure failure;

  const RecomendationBooksFaild({required this.failure});
}

final class RecomendationBooksLoading extends RecomendationBooksState {}
