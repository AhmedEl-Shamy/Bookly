import 'package:bloc/bloc.dart';
import 'package:bookly/core/utlis/failure.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utlis/either_type.dart';
import '../../../data/repos/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;
  Future<void> getNewestBooks() async {
    emit(NewestBooksLoading());
    Either<Failure, List<BookModel>> data = await homeRepo.fetchNewestBooks();
    data.fold(
      errorFunction: (Failure error) {
        emit(NewestBooksFailed(error));
      },
      successFunction: (List<BookModel> books){
        emit(NewestBooksSuccess(books));
      },
    );
  }
}

