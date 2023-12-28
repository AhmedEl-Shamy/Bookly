import 'package:bookly/core/utlis/api_service.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';

class ServicesConfig {
  static late final ApiService apiService;
  static late final HomeRepo homeRepo;

  static void init(){
    apiService = ApiService(Dio());
    homeRepo = HomeRepoImpl(apiService);
  }
}