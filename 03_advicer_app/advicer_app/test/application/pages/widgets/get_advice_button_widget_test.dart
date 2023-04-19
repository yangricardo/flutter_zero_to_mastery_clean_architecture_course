import 'package:advicer_app/application/pages/advice/widgets/get-advices.button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

abstract class GetAdviceButtonOnTap {
  void call();
}

class MockGetAdviceButtonOnTap extends Mock implements GetAdviceButtonOnTap {}

void main() {
  Widget widgetUnderTest({required Function() onTap}) {
    return MaterialApp(
        home: Scaffold(
      body: GetAdvicesButton(onTap: onTap),
    ));
  }

  group('GetAdviceButton', () {
    group('is Button rendered correctly', () {
      testWidgets('and has all parts that it needs', (widgetTester) async {
        final mockGetAdviceButtonOnTap = MockGetAdviceButtonOnTap();
        await widgetTester
            .pumpWidget(widgetUnderTest(onTap: mockGetAdviceButtonOnTap));
        final buttonLabelFinder = find.text('Get Advice');
        expect(buttonLabelFinder, findsOneWidget);
      });
    });
    group('should handle on tap event', () {
      testWidgets('when someone has pressed the button', (widgetTester) async {
        final mockGetAdviceButtonOnTap = MockGetAdviceButtonOnTap();
        await widgetTester
            .pumpWidget(widgetUnderTest(onTap: mockGetAdviceButtonOnTap));
        final getAdvicesButtonFinder = find.byType(GetAdvicesButton);
        await widgetTester.tap(getAdvicesButtonFinder);
        await widgetTester.tap(getAdvicesButtonFinder);
        verify(mockGetAdviceButtonOnTap).called(2);
      });
    });
  });
}
