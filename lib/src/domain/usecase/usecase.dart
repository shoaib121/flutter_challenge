import 'package:either_dart/either.dart';

abstract class UseCase<ReturnType> {
  Future<Either<Error, ReturnType>> invoke();
}
