part of 'search_data_cubit.dart';

sealed class SearchState{
  const SearchState();
}

final class SearchInitial extends SearchState {}
final class SearchSuccess extends SearchState {
  final List<BookEntity> books;

  const SearchSuccess({required this.books});
  
}
final class SearchFailure extends SearchState {
  final Failure failure;

 const  SearchFailure({required this.failure});

}
final class SearchLoading extends SearchState {}
final class SearchPaginationFailure extends SearchState {
  final Failure failure;

  const SearchPaginationFailure({required this.failure});

}