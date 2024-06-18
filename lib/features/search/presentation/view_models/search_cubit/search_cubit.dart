import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/utlis/either_type.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepoImpl) : super(SearchInitial());
  final SearchRepo _searchRepoImpl;
  final TextEditingController controller = TextEditingController();
  Future<void> fetchSearchData() async {
    emit(SearchLoading());
    Either<Failure, List<BookModel>> data =
        await _searchRepoImpl.fetchSearchData(controller.text);
    data.fold(
      errorFunction: (failure) {
        emit(
          SearchFailure(failure: failure),
        );
      },
      successFunction: (books) {
        emit(
          SearchSuccess(books: books),
        );
      },
    );
  }
}
