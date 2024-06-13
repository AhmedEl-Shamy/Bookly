import 'package:bookly/core/utlis/either_type.dart';
import 'package:bookly/core/utlis/failure.dart';

abstract class UseCase<Type, ParameterType> {
  Future<Either<Failure, Type>> call(ParameterType p);
}