import 'package:advicer_app/data/datasources/advice.remote.datasource.dart';
import 'package:advicer_app/data/models/advice.model.dart';
import 'package:advicer_app/data/repositories/advice.repo.impl.dart';
import 'package:advicer_app/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'AdviceRepoImpl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDatasourceImpl>()])
void main() {
  group('AdviceRepoImpl', () {
    group('should return AdviceEntity', () {
      test('when AdviceRemoteDataSource returns AdviceModel', () async {
        final mockAdviceRemoteDatasourceImpl = MockAdviceRemoteDatasourceImpl();
        final adviceRepoImplUnderTest = AdviceRepoImpl(
            adviceRemoteDatasource: mockAdviceRemoteDatasourceImpl);
        when(mockAdviceRemoteDatasourceImpl.getRandomAdviceFromApi())
            .thenAnswer((realInvocation) =>
                Future.value(AdviceModel(advice: 'test', id: 42)));
        final result = await adviceRepoImplUnderTest.getAdviceFromDataSource();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result,
            Left<AdviceModel, Failure>(AdviceModel(advice: 'test', id: 42)));
        verify(mockAdviceRemoteDatasourceImpl.getRandomAdviceFromApi())
            .called(1);
        verifyNoMoreInteractions(mockAdviceRemoteDatasourceImpl);
      });
    });
  });
}
