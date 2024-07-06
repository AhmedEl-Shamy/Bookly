import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/domain/usecases/fetch_recommendation_books_pagination_usecase.dart';
import 'package:bookly/features/home/domain/usecases/fetch_recommendation_books_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utlis/failure.dart';

part 'recommendation_books_state.dart';

class RecommendationBooksCubit extends Cubit<RecommendationBooksState> {
  final FetchRecommendationBooksUseCase _fetchRecommendationBooksUseCase;
  final FetchRecommendationBooksPaginationUseCase _booksPaginationUsecase;

  RecommendationBooksCubit({
    required FetchRecommendationBooksUseCase fetchRecommendationBooksUseCase,
    required FetchRecommendationBooksPaginationUseCase booksPaginationUsecase,
  })  : _fetchRecommendationBooksUseCase = fetchRecommendationBooksUseCase,
        _booksPaginationUsecase = booksPaginationUsecase,
        super(
          RecommendationBooksInitial(),
        );

  Future<void> getRecommendationBooks(String category) async {
    emit(RecommendationBooksLoading());
    Either<Failure, List<BookEntity>> data =
        await _fetchRecommendationBooksUseCase.call(category);
    data.fold(
      (Failure error) {
        emit(RecommendationBooksFaild(failure: error));
      },
      (List<BookEntity> books) {
        emit(RecommendationBooksSuccess(books: books));
      },
    );
  }

  Future<void> getRecommendationPaginationBooks(
      String category, int startIndex) async {
    emit(RecommendationBooksLoading());
    Either<Failure, List<BookEntity>> data = await _booksPaginationUsecase.call(
      {
        'category': category,
        'startIndex': startIndex,
      },
    );
    data.fold(
      (Failure error) {
        emit(RecommendationBooksPaginationField(failure: error));
      },
      (List<BookEntity> books) {
        emit(RecommendationBooksSuccess(books: books));
      },
    );
  }
}
