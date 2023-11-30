import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:testing_flutter_hooks/screens/animation_hook_example.dart';

import 'screens/app_life_cycle_hook_example..dart';
import 'screens/reducers_hook_example.dart';
import 'screens/simple_hook_example.dart';
import 'screens/simple_hook_example2.dart';
import 'screens/memoized_and_future_hook_example3.dart';
import 'screens/listenable_hook_example4.dart';
import 'screens/stream controller_hook_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppLifeCycleHookExample(),
    );
  }
}
