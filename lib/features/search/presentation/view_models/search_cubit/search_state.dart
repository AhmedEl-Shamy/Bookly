part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}
final class SearchSuccess extends SearchState {
  final List<BookModel> books;

  const SearchSuccess({required this.books});
  
}
final class SearchFailure extends SearchState {
  final Failure failure;

 const  SearchFailure({required this.failure});

}
final class SearchLoading extends SearchState {}