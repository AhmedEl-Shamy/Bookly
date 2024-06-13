import 'package:bookly/core/utlis/either_type.dart';
import 'package:bookly/core/utlis/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}