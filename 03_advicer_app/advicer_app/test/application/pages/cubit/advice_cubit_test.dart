import 'package:advicer_app/application/pages/advice/cubit/advicer_cubit.dart';
import 'package:advicer_app/domain/usecases/advice.usecases.dart';
import 'package:bloc_test/bloc_test.dart';
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
    });
  });
}
