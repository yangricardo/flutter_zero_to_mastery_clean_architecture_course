import 'package:advicer_app/domain/entities/advice.entity.dart';
import 'package:advicer_app/domain/failures/failure.dart';
import 'dart:math';

import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<AdviceEntity, Failure>> getAdvice() async {
    Random random = Random();
    int randomId = random.nextInt(10);
    await Future.delayed(const Duration(seconds: 3), () {});
    if (randomId % 2 == 0) {
      return left(
          AdviceEntity(advice: 'Some fake advice from entity', id: randomId));
    }

    return right(GeneralFailure());
  }
}
