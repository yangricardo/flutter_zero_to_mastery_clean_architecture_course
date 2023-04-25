import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/pages/overview/view_states/todo_overview_loading.dart';

void main() {
  Widget widgetUnderTest() {
    return const MaterialApp(home: ToDoOverviewLoading());
  }

  group('ToDoOverviewLoading', () {
    testWidgets('should display circular progress indicator widget',
        (widgetTester) async {
      await widgetTester.pumpWidget(widgetUnderTest());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
