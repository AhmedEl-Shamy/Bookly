import 'package:bookly/core/services/api_service.dart';
import 'package:bookly/features/home/domain/repositories/home_repo.dart';
import 'package:bookly/features/home/data/repositories/home_repo_impl.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:bookly/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';

class ServicesConfig {
  static late final ApiService apiService;
  static late final HomeRepo homeRepo;
  static late final SearchRepo searchRepo;
  static void init(){
    apiService = ApiService(Dio());
    homeRepo = HomeRepoImpl(apiService);
    searchRepo = SearchRepoImpl(apiService);
  }
}