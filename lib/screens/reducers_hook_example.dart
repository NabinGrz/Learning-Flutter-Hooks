import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url =
    "https://media.istockphoto.com/id/1470130937/photo/young-plants-growing-in-a-crack-on-a-concrete-footpath-conquering-adversity-concept.webp?b=1&s=170667a&w=0&k=20&c=IRaA17rmaWOJkmjU_KD29jZo4E6ZtG0niRpIXQN17fc=";

class ReducerHookExample extends HookWidget {
  const ReducerHookExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reducer"),
      ),
    );
  }
}
