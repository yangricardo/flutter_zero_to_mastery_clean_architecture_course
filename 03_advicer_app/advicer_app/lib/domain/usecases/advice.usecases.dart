import 'package:advicer_app/domain/entities/advice.entity.dart';
import 'package:advicer_app/domain/failures/failure.dart';
import 'dart:math';

import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<AdviceEntity, Failure>> getAdvice() async {
    Random random = Random();
    await Future.delayed(const Duration(seconds: 3), () {});
    return left(AdviceEntity(
        advice: 'Some fake advice from entity', id: random.nextInt(10)));
  }
}
