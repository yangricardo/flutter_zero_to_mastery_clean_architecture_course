import 'package:advicer_app/domain/entities/advice.entity.dart';
import 'package:advicer_app/domain/failures/failure.dart';
import 'dart:math';

import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<AdviceEntity, Failure>> getAdvice() async {
    Random random = Random();
    int randomId = random.nextInt(100);
    await Future.delayed(const Duration(seconds: 3), () {});
    if (randomId % 2 == 0) {
      return left(
          AdviceEntity(advice: 'Some fake advice from entity', id: randomId));
    }
    if (randomId % 3 == 0) {
      return right(ServerFailure(id: randomId));
    }
    if (randomId % 5 == 0) {
      return right(CacheFailure(id: randomId));
    }
    return right(GeneralFailure(id: randomId));
  }
}
