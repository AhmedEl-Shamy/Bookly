import 'package:bloc/bloc.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utlis/either_type.dart';
import '../../../data/repos/home_repo.dart';

part 'recomendation_books_state.dart';

class RecomendationBooksCubit extends Cubit<RecomendationBooksState> {
  RecomendationBooksCubit(this.homeRepo) : super(RecomendationBooksInitial());
  final HomeRepo homeRepo;
  Future<void> getRecomendationBooks(String category) async {
    emit(RecomendationBooksLoading());
    Either<Failure, List<BookModel>> data = await homeRepo.fetchRecomendationBooks(category: category);
    data.fold(
      errorFunction: (Failure error) {
        emit(RecomendationBooksFaild(failure: error));
      },
      successFunction: (List<BookModel> books){
        emit(RecomendationBooksSuccess(books: books));
      },
    );
  }
}

