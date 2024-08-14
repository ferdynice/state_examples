import 'package:flutter/material.dart';

class MyBasicValueNotifierApp extends StatelessWidget {
  const MyBasicValueNotifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: 'ValueNotifier');
  }
}

final counter = ValueNotifier<int>(0);

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
            ValueListenableBuilder<int>(
                valueListenable: counter,
                builder: (context, value, _) {
                  return Text('$value',
                      style: Theme.of(context).textTheme.headlineSmall);
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
