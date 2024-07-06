import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utlis/failure.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeaturedBooksUseCase _fetchFeaturedBooksUseCase;

  FeaturedBooksCubit({
    required FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase,
  })  : _fetchFeaturedBooksUseCase = fetchFeaturedBooksUseCase,
        super(FeaturedBooksInitial());
  
  Future<void> getFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    Either<Failure, List<BookEntity>> result =
        await _fetchFeaturedBooksUseCase.call();
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
