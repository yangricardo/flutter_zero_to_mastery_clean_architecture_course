import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:todo_app/core/use_case.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:todo_app/domain/entities/todo_color_entity.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/failures/failure.dart';
import 'package:todo_app/domain/use_cases/load_todo_collection.dart';
import 'package:todo_app/pages/overview/cubit/todo_overview_cubit.dart';

class MockLoadToDoCollections extends Mock implements LoadToDoCollections {}

void main() {
  group(
      'ToDoOverviewCubit',
      () => {
            group('should emits', () {
              MockLoadToDoCollections mockLoadToDoCollections =
                  MockLoadToDoCollections();
              blocTest('empty state when created',
                  build: () => TodoOverviewCubit(
                      loadToDoCollections: mockLoadToDoCollections),
                  expect: () => <TodoOverviewState>[]);
              final todoCollections = List<ToDoCollection>.generate(
                  10,
                  (index) => ToDoCollection(
                      id: CollectionId.fromUniqueString(index.toString()),
                      title: 'Task $index',
                      color: ToDoColor(
                          colorIndex:
                              index % ToDoColor.predefinedColors.length)));
              blocTest('loading state when readToDoCollections is called',
                  build: () => TodoOverviewCubit(
                      loadToDoCollections: mockLoadToDoCollections),
                  setUp: () =>
                      when(() => mockLoadToDoCollections.call(NoParams()))
                          .thenAnswer((_) async =>
                              Future.value(Right(todoCollections))),
                  act: (cubit) => cubit.readToDoCollections(),
                  expect: () => <TodoOverviewState>[
                        ToDoOverviewLoadingState(),
                        ToDoOverviewLoadedState(collections: todoCollections)
                      ]);

              blocTest('error state when readToDoCollections is called',
                  setUp: () => {
                        when(() => mockLoadToDoCollections.call(NoParams()))
                            .thenAnswer((_) async =>
                                Future.value(Left(ServerFailure())))
                      },
                  build: () {
                    when(() => mockLoadToDoCollections.call(NoParams()))
                        .thenAnswer(
                            (_) async => Future.value(Left(ServerFailure())));
                    return TodoOverviewCubit(
                        loadToDoCollections: mockLoadToDoCollections);
                  },
                  act: (cubit) => cubit.readToDoCollections(),
                  expect: () => <TodoOverviewState>[
                        ToDoOverviewLoadingState(),
                        ToDoOverviewErrorState()
                      ]);
            })
          });
}
