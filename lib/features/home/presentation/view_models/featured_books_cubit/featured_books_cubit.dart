import 'package:bloc/bloc.dart';
import 'package:bookly/core/utlis/either_type.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  Future<void> getFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    Either<Failure, List<BookModel>> data = await homeRepo.fetchFeaturedBooks();
    data.fold(
      errorFunction: (Failure error) {
        emit(FeaturedBooksFailed(error));
      },
      successFunction: (List<BookModel> books){
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
