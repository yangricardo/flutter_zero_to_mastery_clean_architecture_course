import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:todo_app/domain/entities/todo_color_entity.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/pages/overview/view_states/todo_overview_loaded.dart';

void main() {
  Widget widgetUnderTest({required List<ToDoCollection> collections}) {
    return MaterialApp(
        home: Material(
            child: ToDoOverviewLoaded(
      collections: collections,
    )));
  }

  group('ToDoOverviewLoaded', () {
    testWidgets('should display list view with 10 items', (widgetTester) async {
      final todoCollections = List<ToDoCollection>.generate(
          10,
          (index) => ToDoCollection(
              id: CollectionId.fromUniqueString(index.toString()),
              title: 'Task $index',
              color: ToDoColor(
                  colorIndex: index % ToDoColor.predefinedColors.length)));
      await widgetTester
          .pumpWidget(widgetUnderTest(collections: todoCollections));
      await widgetTester.pumpAndSettle();
      expect(find.byType(ToDoOverviewLoaded), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(10));
    });
  });
}
