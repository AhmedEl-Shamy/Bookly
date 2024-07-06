import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/search/domain/usecases/fetch_search_data_pagination_usecase.dart';
import 'package:bookly/features/search/domain/usecases/fetch_search_data_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_data_state.dart';

class SearchDataCubit extends Cubit<SearchState> {
  final FetchSearchDataUsecase _fetchSearchDataUsecase;
  final FetchSearchDataPaginationUseCase _dataPaginationUsecase;
  final TextEditingController controller = TextEditingController();

  SearchDataCubit({
    required FetchSearchDataUsecase fetchSearchDataUsecase,
    required FetchSearchDataPaginationUseCase fetchSearchDataPaginationUseCase,
  })  : _fetchSearchDataUsecase = fetchSearchDataUsecase,
        _dataPaginationUsecase = fetchSearchDataPaginationUseCase,
        super(SearchInitial());

  Future<void> fetchSearchData() async {
    emit(SearchLoading());
    String searchStr = controller.text;
    Either<Failure, List<BookEntity>> data =
        await _fetchSearchDataUsecase.call(searchStr);
    data.fold(
      (failure) {
        emit(
          SearchFailure(failure: failure),
        );
      },
      (books) {
        emit(
          SearchSuccess(books: books),
        );
      },
    );
  }

  Future<void> fetchSearchPaginationData(int startIndex) async {
    emit(SearchLoading());
    String searchStr = controller.text;
    Either<Failure, List<BookEntity>> data = await _dataPaginationUsecase.call({
      'searchStr': searchStr,
      'startIndex': startIndex,
    });
    data.fold(
      (failure) {
        emit(
          SearchPaginationFailure(failure: failure),
        );
      },
      (books) {
        emit(
          SearchSuccess(books: books),
        );
      },
    );
  }
}
