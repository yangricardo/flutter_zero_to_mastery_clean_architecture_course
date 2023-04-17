import 'package:advicer_app/data/repositories/advice.repo.impl.dart';
import 'package:advicer_app/domain/entities/advice.entity.dart';
import 'package:advicer_app/domain/failures/failure.dart';

import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final AdviceRepoImpl adviceRepo;

  AdviceUseCases({required this.adviceRepo});

  Future<Either<AdviceEntity, Failure>> getAdvice() async {
    return adviceRepo.getAdviceFromDataSource();
  }
}
