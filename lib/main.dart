import 'package:flutter/material.dart';
import 'package:state_examples/state_examples/basic_inherited.dart';
import 'package:state_examples/state_examples/basic_stateful.dart';
import 'package:state_examples/state_examples/basic_valuenotifier.dart';
import 'package:state_examples/state_examples/bloc_bloc.dart';
import 'package:state_examples/state_examples/bloc_cubit.dart';
import 'package:state_examples/state_examples/riverpod_notifier.dart';
import 'package:state_examples/state_examples/riverpod_statenotifier.dart';
import 'package:state_examples/state_examples/riverpod_stateprovider.dart';

void main() {
  runApp(const MyApp.allExamples());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.examples});

  const MyApp.allExamples({super.key})
      : examples = const [
          MyBasicInheritedApp(),
          MyBasicStatefulApp(),
          MyBasicValueNotifierApp(),
          MyBlocBlocApp(),
          MyBlocCubitApp(),
          MyRiverpodNotifierApp(),
          MyRiverpodStateNotifierApp(),
          MyRiverpodStateProviderApp(),
        ];

  final List<Widget> examples;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counters Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scrollbarTheme: ScrollbarThemeData(
          thickness: WidgetStateProperty.all(16),
          thumbVisibility: WidgetStateProperty.all(true),
          trackVisibility: WidgetStateProperty.all(true),
        ),
        useMaterial3: true,
      ),
      home: ListView.separated(
          itemCount: examples.length,
          itemBuilder: (_, int index) {
            return SizedBox(
              height: 150,
              child: examples[index],
            );
          },
          separatorBuilder: (_, __) => const Divider(
                color: Colors.black,
                height: 8,
              )),
    );
  }
}
