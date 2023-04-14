import 'package:advicer_app/domain/entities/advice.entity.dart';
import 'package:advicer_app/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AdviceRepo {
  Future<Either<AdviceEntity, Failure>> getAdviceFromDataSource();
}
