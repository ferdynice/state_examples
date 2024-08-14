import 'package:flutter/material.dart';

class MyBasicInheritedApp extends StatelessWidget {
  const MyBasicInheritedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CounterWidget(
      child: MyHomePage(title: 'Inherited'),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, required this.child});
  final Widget child;

  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<CounterWidget> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _counter,
      increment: _increment,
      child: widget.child,
    );
  }
}

class CounterProvider extends InheritedWidget {
  const CounterProvider({
    super.key,
    required this.count,
    required this.increment,
    required super.child,
  });

  final int count;
  final VoidCallback increment;

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return count != oldWidget.count;
  }

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>()!;
  }
}

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
            Text(
              '${CounterProvider.of(context).count}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => CounterProvider.of(context).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
