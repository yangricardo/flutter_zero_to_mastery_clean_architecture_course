import 'package:advicer_app/domain/entities/advice.entity.dart';
import 'package:advicer_app/domain/failures/failure.dart';
import 'package:advicer_app/domain/repositories/advice.repo.dart';

import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final AdviceRepo adviceRepo;

  AdviceUseCases({required this.adviceRepo});

  Future<Either<AdviceEntity, Failure>> getAdvice() async {
    return adviceRepo.getAdviceFromDataSource();
  }
}
