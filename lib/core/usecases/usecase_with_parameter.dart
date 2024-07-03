import 'package:bookly/core/utlis/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, ParameterType> {
  Future<Either<Failure, Type>> call(ParameterType p);
}