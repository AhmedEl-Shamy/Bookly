import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/features/home/domain/repositories/home_repo.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  Future<void> getFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    Either<Failure, List<BookEntity>> result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (Failure error) {
        emit(FeaturedBooksFailed(error));
      },
      (List<BookEntity> books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
