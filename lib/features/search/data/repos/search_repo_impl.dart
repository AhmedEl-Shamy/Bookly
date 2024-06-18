import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/services/api_service.dart';
import '../../../../core/utlis/either_type.dart';
import '../../../../core/utlis/failure.dart';
import 'search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService _apiService;
  SearchRepoImpl(this._apiService);
  @override
  Future<Either<Failure,List<BookModel>>> fetchSearchData(String searchStr) async {
    try {
      Map<String, dynamic> data = await _apiService.get(
        endPoint:
            '/volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$searchStr',
      );
      List<BookModel> books = List.empty(growable: true);
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return Either(data: books);
    } on Exception catch (e) {
      if (e is DioException) {
        return Either(
          error: ServerFailure.fromDioException(e),
        );
      }
      return Either(error: ServerFailure(e.toString()));
    }
  }
}
