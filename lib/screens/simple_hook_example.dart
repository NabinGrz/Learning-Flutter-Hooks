import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Stream<String> getTime() => Stream.periodic(
    const Duration(seconds: 1), (_) => DateTime.now().toIso8601String());

class SimpleHookExample extends HookWidget {
  const SimpleHookExample({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = useStream(getTime());
    return Scaffold(
      appBar: AppBar(
        title: Text(dateTime.data ?? "Homepage"),
      ),
    );
  }
}
