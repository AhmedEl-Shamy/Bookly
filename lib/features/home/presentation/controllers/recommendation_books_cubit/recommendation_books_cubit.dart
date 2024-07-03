import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/usecases/fetch_recommendation_books_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utlis/failure.dart';


part 'recommendation_books_state.dart';

class RecommendationBooksCubit extends Cubit<RecommendationBooksState> {
  final FetchRecommendationBooksUseCase _fetchRecommendationBooksUseCase;

  RecommendationBooksCubit({
    required FetchRecommendationBooksUseCase fetchRecommendationBooksUseCase,
  })  : _fetchRecommendationBooksUseCase = fetchRecommendationBooksUseCase,
        super(RecommendationBooksInitial());
        
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
}
