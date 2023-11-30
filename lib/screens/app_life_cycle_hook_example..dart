import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppLifeCycleHookExample extends HookWidget {
  const AppLifeCycleHookExample({super.key});

  @override
  Widget build(BuildContext context) {
    final state = useAppLifecycleState();
    return Scaffold(
      appBar: AppBar(
        title: const Text("App life cycle state hook"),
      ),
      body: Center(
        child: Text(
          "App Life Cycle: $state",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
