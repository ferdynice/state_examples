import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:state_examples/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Test incrementing counters for all apps.', (tester) async {
    const myApp = MyApp.allExamples();
    await tester.pumpWidget(myApp);

    // Generate golden images with:
    // `flutter test integration_test --update-goldens`.
    // The output is platform/device specific.
    // Then you can uncomment the matchesGoldenFile lines to check it.
    // await expectLater(
    //     find.byWidget(myApp), matchesGoldenFile('golden_image_0.png'));

    for (final app in myApp.examples) {
      debugPrint('Testing example app $app');

      final findApp = find.byType(app.runtimeType);
      final findButton = find.descendant(
          of: findApp, matching: find.bySubtype<FloatingActionButton>());

      // Scroll to the example app.
      await tester.scrollUntilVisible(
        findButton,
        50.0,
        scrollable: find.byType(Scrollable),
      );

      // Find the counter to be "0".
      final findTextZero =
          find.descendant(of: findApp, matching: find.text('0'));
      expect(findTextZero, findsOne);

      // Tap increment button.
      await tester.tap(findButton);
      await tester.pumpAndSettle();

      // Find the counter to be "1".
      final findTextOne =
          find.descendant(of: findApp, matching: find.text('1'));
      expect(findTextOne, findsOne);
    }
    // await expectLater(
    //     find.byWidget(myApp), matchesGoldenFile('golden_image_1.png'));
  });
}
