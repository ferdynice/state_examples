# state_examples

A Flutter project implementing various state "Counter" examples, for comparison/tutorial purposes.

Includes examples using:
* Basic Flutter building blocks ([StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html), [ValueNotifier](https://api.flutter.dev/flutter/foundation/ValueNotifier-class.html) and [InheritedWidget](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)). StatefulWidget is from the generated example project. ValueNotifier uses a different method to handle state and InheritedWidget is the most complex/verbose of all.
* Riverpod (`StateProvider`, `StateNotifier` and `Notifier`). Uses both ConsumerWidget and Consumer to highlight the differences. Check [this Stack Overflow](https://stackoverflow.com/questions/76348944/when-to-use-consumerwidget-and-consumer) for when to use what. As for the actual providers: StateProvider is mutable and can be modified from outside, whereas StateNotifier handles state in an immutable member field, generally resulting in cleaner state management. Notifier is the newest of all and is mostly about improved syntax: initial state is declared in a build method instead of the constructor. Also its state is mutable yet *protected* meaning you can only change it in your Notifier class methods (or at least the Dart compiler will warn you about it). [Migration guide](https://riverpod.dev/docs/migration/from_state_notifier).
* Bloc (regular `Bloc` and `Cubit`). Difference is explained in [this Stack Overflow](https://stackoverflow.com/questions/63131067/what-is-the-difference-between-cubit-and-bloc) and [here](https://bloclibrary.dev/bloc-concepts/#cubit-vs-bloc).

If you run the main app all examples are executed at once in the same app. There is a common main widget (nothing more than a MaterialApp with a scrollable ListView) that serves as the entrypoint for the examples (in the `lib/state_examples/` dir).

Also includes a basic widget test as well as an integration test. Instructions are provided in the integration test for adding golden image checks (meaning that the testrunner compares the screen output to reference images).

Run application:
```
flutter run
```

Run basic tests:
```
flutter test
```

Run integration tests:
```
flutter test integration_test/
```
