import 'package:dio/dio.dart';

abstract class ApiService {
  Future<Map<String, dynamic>> get ({required String endPoint});
}

class ApiServiceImp extends ApiService{
  final String _baseURL = 'https://www.googleapis.com/books/v1';
  final Dio _dio;

  ApiServiceImp(this._dio);

  @override
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Response response =  await _dio.get('$_baseURL$endPoint');
    return response.data;
  }
}