import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyRiverpodStateNotifierApp extends StatelessWidget {
  const MyRiverpodStateNotifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MyHomePage(title: 'Riverpod StateNotifier'),
    );
  }
}

class Counter {
  Counter(this._counter);

  final int _counter;
}

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(Counter(0));

  void increment() {
    state = Counter(state._counter + 1);
  }
}

final counterProvider =
    StateNotifierProvider<CounterNotifier, Counter>((_) => CounterNotifier());

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Consumer(
              builder: (_, ref, __) => Text(
                  '${ref.watch(counterProvider)._counter}',
                  style: Theme.of(context).textTheme.headlineSmall),
            )
          ],
        ),
      ),
      floatingActionButton: const IncrementButtonWidget(),
    );
  }
}

class IncrementButtonWidget extends ConsumerWidget {
  const IncrementButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).increment(),
        child: const Icon(Icons.add));
  }
}
