import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class UseCase<Type, P extends Params> {
  Future<Either<Failure, Type>> call(P params);
}

mixin Params {}

class NoParams with Params {}
