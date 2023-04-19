import 'package:advicer_app/application/pages/advice/widgets/advice.field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget widgetUnderTest({required String advice}) {
    return MaterialApp(
      home: AdviceField(advice: advice),
    );
  }

  group('AdviceField', () {
    group('should be displayed correctly', () {
      testWidgets('when a short text is given', (widgetTester) async {
        const text = 'Advice test message';
        await widgetTester.pumpWidget(widgetUnderTest(advice: text));
        await widgetTester.pumpAndSettle();
        final adviceFieldFinder = find.byType(AdviceField);
        expect(adviceFieldFinder, findsOneWidget);
      });
      testWidgets('when a long text is given', (widgetTester) async {
        const text =
            'Advice test message for very long text sample.Advice test message for very long text sample.Advice test message for very long text sample.Advice test message for very long text sample.Advice test message for very long text sample.Advice test message for very long text sample.';
        await widgetTester.pumpWidget(widgetUnderTest(advice: text));
        await widgetTester.pumpAndSettle();
        final adviceFieldFinder = find.byType(AdviceField);
        expect(adviceFieldFinder, findsOneWidget);
      });
      testWidgets('when a empty text is given', (widgetTester) async {
        const text = '';
        await widgetTester.pumpWidget(widgetUnderTest(advice: text));
        await widgetTester.pumpAndSettle();
        final adviceFieldFinder = find.byType(AdviceField);
        final adviceText =
            widgetTester.widget<AdviceField>(find.byType(AdviceField)).advice;
        expect(adviceFieldFinder, findsOneWidget);
        expect(adviceText, '');
      });
    });
  });
}
