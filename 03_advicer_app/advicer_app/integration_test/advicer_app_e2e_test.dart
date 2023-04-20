import 'package:advicer_app/application/pages/advice/widgets/advice.field.dart';
import 'package:advicer_app/application/pages/advice/widgets/get-advices.button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:advicer_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('e2e test', () {
    testWidgets('tap on get advice button, verify advice will be loaded',
        (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();
      expect(find.textContaining('Your advice is waiting for you!'),
          findsOneWidget);

      final getAdviceButtonFinder = find.byType(GetAdvicesButton);

      await widgetTester.tap(getAdviceButtonFinder);
      await widgetTester.pumpAndSettle();
      expect(find.byType(AdviceField), findsOneWidget);
      expect(find.textContaining('"'), findsOneWidget);
      expect(find.textContaining('"'), findsOneWidget);
    });
  });
}
