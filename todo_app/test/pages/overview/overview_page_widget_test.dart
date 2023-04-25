import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/data/repositories/todo_repository_mock.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';
import 'package:todo_app/pages/overview/cubit/todo_overview_cubit.dart';
import 'package:todo_app/pages/overview/overview_page.dart';

class MockOverviewPageCubit extends MockCubit<TodoOverviewState>
    implements TodoOverviewCubit {}

void main() {
  Widget widgetUnderTest({required TodoOverviewCubit cubit}) {
    return MaterialApp(
        home: RepositoryProvider<TodoRepository>(
            create: (context) => TodoRepositoryMock(),
            child: BlocProvider(
              create: (context) => cubit,
              child: const OverviewPage(),
            )));
  }

  group('OverviewPage', () {
    late TodoOverviewCubit mockTodoOverviewCubit;
    setUp(() => mockTodoOverviewCubit = MockOverviewPageCubit());

    group('ToDoOverview Cubit States', () {
      testWidgets(
        'loading state should display circular progress indicator widget',
        (widgetTester) async {
          whenListen(
            mockTodoOverviewCubit,
            Stream.fromIterable([ToDoOverviewLoadingState()]),
            initialState: ToDoOverviewLoadingState(),
          );
          await widgetTester
              .pumpWidget(widgetUnderTest(cubit: mockTodoOverviewCubit));
          await widgetTester.pump();
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        },
      );
    });
  });
}
