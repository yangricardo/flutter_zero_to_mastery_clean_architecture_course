import 'package:advicer_app/application/pages/advice/bloc/advicer_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

void main() {
  group('AdvicerBloc', () {
    group('should emits', () {
      blocTest<AdvicerBloc, AdvicerState>(
        'nothing when no event is added',
        build: () => AdvicerBloc(),
        expect: () => const <AdvicerState>[],
      );
      blocTest(
        '[AdvicerStateLoading, AdvicerStateError] when AdviceRequestedEvent is added',
        build: () => AdvicerBloc(),
        act: (bloc) => bloc.add(AdviceRequestedEvent()),
        wait: const Duration(seconds: 3),
        expect: () => <AdvicerState>[
          AdvicerStateLoading(),
          AdvicerStateError('error message')
        ],
      );
    });
  });
}
