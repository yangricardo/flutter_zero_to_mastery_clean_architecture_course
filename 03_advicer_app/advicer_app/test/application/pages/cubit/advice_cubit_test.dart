import 'package:advicer_app/application/pages/advice/cubit/advicer_cubit.dart';
import 'package:advicer_app/domain/entities/advice.entity.dart';
import 'package:advicer_app/domain/failures/failure.dart';
import 'package:advicer_app/domain/usecases/advice.usecases.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockAdviceUseCases extends Mock implements AdviceUseCases {}

void main() {
  group('AdvicerCubit', () {
    group('should emits', () {
      MockAdviceUseCases mockAdvicerUseCases = MockAdviceUseCases();
      blocTest(
        'nothing when no event is added',
        build: () => AdvicerCubit(adviceUseCases: mockAdvicerUseCases),
        expect: () => const <AdvicerCubitState>[],
      );
      blocTest(
        '[AdvicerCubitStateLoading, AdvicerCubitStateLoaded] when requestAdvice() is called',
        setUp: () => when(() => mockAdvicerUseCases.getAdvice()).thenAnswer(
          (invocation) => Future.value(
            const Left<AdviceEntity, Failure>(
              AdviceEntity(advice: 'advice', id: 1),
            ),
          ),
        ),
        build: () => AdvicerCubit(adviceUseCases: mockAdvicerUseCases),
        act: (cubit) => cubit.requestAdvice(),
        expect: () => <AdvicerCubitState>[
          AdvicerCubitStateLoading(),
          const AdvicerCubitStateLoaded(advice: '1 - advice')
        ],
      );

      group(
        '[AdvicerStateLoading, AdvicerStateError] when adviceRequested() is called',
        () {
          blocTest(
            'and a ServerFailure occurs',
            setUp: () => when(() => mockAdvicerUseCases.getAdvice()).thenAnswer(
              (invocation) => Future.value(
                const Right<AdviceEntity, Failure>(
                  ServerFailure(id: 502),
                ),
              ),
            ),
            build: () => AdvicerCubit(adviceUseCases: mockAdvicerUseCases),
            act: (cubit) => cubit.requestAdvice(),
            expect: () => <AdvicerCubitState>[
              AdvicerCubitStateLoading(),
              const AdvicerCubitStateError(
                  message: "502 - $serverFailureMessage"),
            ],
          );

          blocTest(
            'and a CacheFailure occurs',
            setUp: () => when(() => mockAdvicerUseCases.getAdvice()).thenAnswer(
              (invocation) => Future.value(
                const Right<AdviceEntity, Failure>(
                  CacheFailure(id: 500),
                ),
              ),
            ),
            build: () => AdvicerCubit(adviceUseCases: mockAdvicerUseCases),
            act: (cubit) => cubit.requestAdvice(),
            expect: () => <AdvicerCubitState>[
              AdvicerCubitStateLoading(),
              const AdvicerCubitStateError(
                  message: "500 - $cacheFailureMessage"),
            ],
          );

          blocTest(
            'and a GeneralFailure occurs',
            setUp: () => when(() => mockAdvicerUseCases.getAdvice()).thenAnswer(
              (invocation) => Future.value(
                const Right<AdviceEntity, Failure>(
                  GeneralFailure(id: 500),
                ),
              ),
            ),
            build: () => AdvicerCubit(adviceUseCases: mockAdvicerUseCases),
            act: (cubit) => cubit.requestAdvice(),
            expect: () => <AdvicerCubitState>[
              AdvicerCubitStateLoading(),
              const AdvicerCubitStateError(
                  message: "500 - $generalFailureMessage"),
            ],
          );
        },
      );
    });
  });
}
