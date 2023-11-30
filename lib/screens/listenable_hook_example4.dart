import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ListenableHookExample4 extends HookWidget {
  const ListenableHookExample4({super.key});

  @override
  Widget build(BuildContext context) {
    final countdown =
        useMemoized(() => Countdown(from: 10)); //* caching the countdown
    final notifier = useListenable(
        countdown); //* calling the build function/rebuild everytime the countdown calls the notifier listener function
    print("Hello World!!");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listenable Hook"),
      ),
      body: Center(
          child: Text(
        "${notifier.value}",
        style: const TextStyle(fontSize: 40),
      )),
    );
  }
}

class Countdown extends ValueNotifier<int> {
  late StreamSubscription subscription;

  Countdown({required int from}) : super(from) {
    subscription = Stream.periodic(
      const Duration(seconds: 1),
      (v) => from - v,
    ).takeWhile((value) => value >= 0).listen((value) {
      this.value = value;
    });
  }
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
