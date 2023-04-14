import 'package:advicer_app/domain/entities/advice.entity.dart';
import 'dart:math';

class AdviceUseCases {
  Future<AdviceEntity> getAdvice() async {
    Random random = Random();
    await Future.delayed(const Duration(seconds: 3), () {});
    return AdviceEntity(
        advice: 'Some fake advice from entity', id: random.nextInt(10));
  }
}
