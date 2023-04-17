import 'package:advicer_app/data/datasources/advice.remote.datasource.dart';
import 'package:advicer_app/data/exceptions/exceptions.dart';
import 'package:advicer_app/domain/entities/advice.entity.dart';
import 'package:advicer_app/domain/failures/failure.dart';
import 'package:advicer_app/domain/repositories/advice.repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl extends AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource;

  AdviceRepoImpl({required this.adviceRemoteDatasource});

  @override
  Future<Either<AdviceEntity, Failure>> getAdviceFromDataSource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
      return left(result);
    } on ServerException catch (_) {
      return right(const ServerFailure(id: 502));
    } catch (e) {
      return right(const GeneralFailure(id: 500));
    }
  }
}
