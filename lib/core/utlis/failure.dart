import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMsg;
  Failure(this.errorMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMsg);
  factory ServerFailure.fromDioException(DioException dioException) {
    DioExceptionType dioExceptionType = dioException.type;
    switch (dioExceptionType) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with server!');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout! with server!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout! with server!');
      case DioExceptionType.badCertificate:
        return ServerFailure('bad Certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response!);
      case DioExceptionType.cancel:
        return ServerFailure('Your Connection with server is canceld!');
      case DioExceptionType.connectionError:
        return ServerFailure(
            'Faild to connect with server, check your internet connection!');
      case DioExceptionType.unknown:
        return ServerFailure('Oops!, there was an error, Please try again!');
      default:
        return ServerFailure('Unexpected error occurred!');
    }
  }

  factory ServerFailure.fromResponse(Response response) {
    int statusCode = response.statusCode!;
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response.data['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Request not found!');
    } else if (statusCode >= 500) {
      return ServerFailure('There was a problem with server, please try later!');
    } else {
      return ServerFailure('Oops!, there was an error, Please try again!');
    }
  }
}
