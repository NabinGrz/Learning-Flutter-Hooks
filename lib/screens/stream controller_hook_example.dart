import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url =
    "https://media.istockphoto.com/id/1470130937/photo/young-plants-growing-in-a-crack-on-a-concrete-footpath-conquering-adversity-concept.webp?b=1&s=170667a&w=0&k=20&c=IRaA17rmaWOJkmjU_KD29jZo4E6ZtG0niRpIXQN17fc=";

class StreamControllerHookExample extends HookWidget {
  const StreamControllerHookExample({super.key});

  @override
  Widget build(BuildContext context) {
    late final StreamController<double> controller;
    controller = useStreamController(onListen: () {
      controller.sink.add(0.0);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream Controller Hook"),
      ),
      body: StreamBuilder<double>(
          stream: controller.stream,
          builder: (context, snapshot) {
            final rotation = snapshot.data ?? 0.0;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "RotationDegree: $rotation",
                    style: const TextStyle(color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      controller.sink.add(10.0 + rotation);
                    },
                    child: RotationTransition(
                        turns: AlwaysStoppedAnimation(rotation / 360),
                        child: Image.network(url)),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.sink.add(0.0);
                      },
                      child: const Text("Reset"))
                ],
              ),
            );
          }),
    );
  }
}
