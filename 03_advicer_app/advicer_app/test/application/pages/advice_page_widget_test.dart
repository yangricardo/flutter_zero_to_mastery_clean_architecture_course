import 'package:advicer_app/application/core/services/theme.service.dart';
import 'package:advicer_app/application/pages/advice/advice.page.dart';
import 'package:advicer_app/application/pages/advice/cubit/advicer_cubit.dart';
import 'package:advicer_app/application/pages/advice/widgets/advice.field.dart';
import 'package:advicer_app/application/pages/advice/widgets/error.message.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

class MockAdvicerCubit extends MockCubit<AdvicerCubitState>
    implements AdvicerCubit {}

void main() {
  Widget widgetUnderTest({required AdvicerCubit cubit}) {
    return MaterialApp(
        home: ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: BlocProvider<AdvicerCubit>(
        create: (context) => cubit,
        child: const AdvicerPage(),
      ),
    ));
  }

  group('AdvicerPage', () {
    late AdvicerCubit mockAdvicerCubit;
    setUp(() => {mockAdvicerCubit = MockAdvicerCubit()});
    group('should be displayed in ViewState', () {
      testWidgets('Initial when cubit emits AdvicerInitial',
          (widgetTester) async {
        whenListen(mockAdvicerCubit, Stream.fromIterable([AdvicerInitial()]),
            initialState: AdvicerInitial());
        await widgetTester.pumpWidget(widgetUnderTest(cubit: mockAdvicerCubit));
        final advicerInitialTextFinder =
            find.text('Your advice is waiting for you!');
        expect(advicerInitialTextFinder, findsOneWidget);
      });

      testWidgets('Loading when cubit emits AdvicerStateLoading()',
          (widgetTester) async {
        whenListen(
            mockAdvicerCubit, Stream.fromIterable([AdvicerCubitStateLoading()]),
            initialState: AdvicerInitial());
        await widgetTester.pumpWidget(widgetUnderTest(cubit: mockAdvicerCubit));
        await widgetTester.pump();
        final advicerLoadingFinder = find.byType(CircularProgressIndicator);
        expect(advicerLoadingFinder, findsOneWidget);
      });

      testWidgets('Loaded when cubit emits AdvicerCubitStateLoaded()',
          (widgetTester) async {
        const adviceText = 'Advice sample';
        whenListen(
            mockAdvicerCubit,
            Stream.fromIterable(
                const [AdvicerCubitStateLoaded(advice: adviceText)]),
            initialState: AdvicerInitial());
        await widgetTester.pumpWidget(widgetUnderTest(cubit: mockAdvicerCubit));
        await widgetTester.pump();
        final advicerLoadedFinder = find.byType(AdviceField);
        final adviceTextFinder =
            widgetTester.widget<AdviceField>(advicerLoadedFinder).advice;
        expect(advicerLoadedFinder, findsOneWidget);
        expect(adviceText, adviceTextFinder);
      });

      testWidgets('Error when cubit emits AdvicerCubitStateError()',
          (widgetTester) async {
        const messageError = 'Advice sample';
        whenListen(
            mockAdvicerCubit,
            Stream.fromIterable(
                const [AdvicerCubitStateError(message: messageError)]),
            initialState: AdvicerInitial());
        await widgetTester.pumpWidget(widgetUnderTest(cubit: mockAdvicerCubit));
        await widgetTester.pump();
        final advicerLoadedFinder = find.byType(ErrorMessage);
        expect(advicerLoadedFinder, findsOneWidget);
      });
    });
  });
}
