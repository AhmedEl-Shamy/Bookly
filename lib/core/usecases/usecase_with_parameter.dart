import 'package:bookly/core/utlis/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCaseWithParameter<ReturnType, ParameterType> {
  Future<Either<Failure, ReturnType>> call(ParameterType p);
}