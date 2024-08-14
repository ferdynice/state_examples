import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_examples/main.dart';

void main() {
  const myApp = MyApp.allExamples();
  test('Test number of app examples', () {
    expect(myApp.examples.length, 8);
  });

  final exampleVariant = ValueVariant<Widget>({...myApp.examples});

  testWidgets('Test incrementing counter.', (tester) async {
    final example = exampleVariant.currentValue!;
    await tester.pumpWidget(MyApp(
      examples: [example],
    ));

    final findApp = find.byType(example.runtimeType);
    final findButton = find.descendant(
        of: findApp, matching: find.bySubtype<FloatingActionButton>());

    // Find the counter to be "0".
    final findTextZero = find.descendant(of: findApp, matching: find.text('0'));
    expect(findTextZero, findsOne);

    // Tap increment button.
    await tester.tap(findButton);
    await tester.pumpAndSettle();

    // Find the counter to be "1".
    final findTextOne = find.descendant(of: findApp, matching: find.text('1'));
    expect(findTextOne, findsOne);
  }, variant: exampleVariant);
}
