import 'package:advicer_app/data/repositories/advice.repo.impl.dart';
import 'package:advicer_app/domain/entities/advice.entity.dart';
import 'package:advicer_app/domain/failures/failure.dart';
import 'package:advicer_app/domain/usecases/advice.usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'AdviceUseCases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRepoImpl>()])
void main() {
  group('AdviceUseCases', () {
    group('should return AdviceEntity', () {
      test(
          'when AdviceRepoImpl returns a AdviceModel',
          () => () async {
                final mockAdviceRepoImpl = MockAdviceRepoImpl();
                final adviceUseCaseUnderTest =
                    AdviceUseCases(adviceRepo: mockAdviceRepoImpl);
                when(mockAdviceRepoImpl.getAdviceFromDataSource()).thenAnswer(
                    (realInvocation) => Future.value(
                        const Left(AdviceEntity(advice: 'test', id: 42))));
                final result = await adviceUseCaseUnderTest.getAdvice();
                expect(result.isLeft(), true);
                expect(result.isRight(), false);
                expect(
                    result,
                    const Left<AdviceEntity, Failure>(
                        AdviceEntity(advice: 'test', id: 42)));
                verify(mockAdviceRepoImpl.getAdviceFromDataSource()).called(1);
                verifyNoMoreInteractions(mockAdviceRepoImpl);
              });
    });
    group('should return right with', () {
      test(
          'a ServerFailure',
          () => () async {
                final mockAdviceRepoImpl = MockAdviceRepoImpl();
                final adviceUseCaseUnderTest =
                    AdviceUseCases(adviceRepo: mockAdviceRepoImpl);
                when(mockAdviceRepoImpl.getAdviceFromDataSource()).thenAnswer(
                    (realInvocation) =>
                        Future.value(const Right(ServerFailure(id: 502))));
                final result = await adviceUseCaseUnderTest.getAdvice();
                expect(result.isLeft(), false);
                expect(result.isRight(), true);
                expect(result,
                    const Right<AdviceEntity, Failure>(ServerFailure(id: 502)));
                verify(mockAdviceRepoImpl.getAdviceFromDataSource()).called(1);
                verifyNoMoreInteractions(mockAdviceRepoImpl);
              });
    });
  });
}
