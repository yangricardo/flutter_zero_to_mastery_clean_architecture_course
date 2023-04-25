import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/pages/overview/view_states/todo_overview_error.dart';

void main() {
  Widget widgetUnderTest() {
    return const MaterialApp(home: ToDoOverviewError());
  }

  group('ToDoOverviewError', () {
    testWidgets('should display error message', (widgetTester) async {
      await widgetTester.pumpWidget(widgetUnderTest());
      expect(find.text('ERROR, please try again'), findsOneWidget);
    });
  });
}
