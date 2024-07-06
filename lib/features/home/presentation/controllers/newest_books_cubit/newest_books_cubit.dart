import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/usecases/fetch_newest_books_pagination.dart';
import 'package:bookly/features/home/domain/usecases/fetch_newest_books_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utlis/failure.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final FetchNewestBooksUseCase _fetchNewestBooksUseCase;
  final FetchNewestBooksPaginationUseCase _fetchNewestBooksPaginationUseCase;
  
  NewestBooksCubit({
    required FetchNewestBooksUseCase fetchNewestBooksUseCase,
    required FetchNewestBooksPaginationUseCase
        fetchNewestBooksPaginationUseCase,
  })  : _fetchNewestBooksUseCase = fetchNewestBooksUseCase,
        _fetchNewestBooksPaginationUseCase = fetchNewestBooksPaginationUseCase,
        super(NewestBooksInitial());

  Future<void> getNewestBooks() async {
    emit(NewestBooksLoading());
    Either<Failure, List<BookEntity>> data =
        await _fetchNewestBooksUseCase.call();
    data.fold(
      (Failure error) {
        emit(NewestBooksFailed(error));
      },
      (List<BookEntity> books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }

  Future<void> getNewestBooksPagination(int startIndex) async {
    emit(NewestBooksLoading());
    Either<Failure, List<BookEntity>> data =
        await _fetchNewestBooksPaginationUseCase.call(startIndex);
    data.fold(
      (Failure error) {
        emit(NewestBooksPaginationFailed(error));
      },
      (List<BookEntity> books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }


}
