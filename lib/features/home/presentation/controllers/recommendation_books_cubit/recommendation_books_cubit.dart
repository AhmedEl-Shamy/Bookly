import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utlis/either_type.dart';
import '../../../domain/repositories/home_repo.dart';

part 'recommendation_books_state.dart';

class RecommendationBooksCubit extends Cubit<RecommendationBooksState> {
  RecommendationBooksCubit(this.homeRepo) : super(RecommendationBooksInitial());
  final HomeRepo homeRepo;
  Future<void> getRecommendationBooks(String category) async {
    emit(RecommendationBooksLoading());
    Either<Failure, List<BookModel>> data = await homeRepo.fetchRecommendationBooks(category: category);
    data.fold(
      errorFunction: (Failure error) {
        emit(RecommendationBooksFaild(failure: error));
      },
      successFunction: (List<BookModel> books){
        emit(RecommendationBooksSuccess(books: books));
      },
    );
  }
}

