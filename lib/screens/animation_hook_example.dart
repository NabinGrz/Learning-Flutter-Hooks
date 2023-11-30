import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension Normalize on num {
  num normalize(
    num selftRangeMin,
    selfRangeMax, [
    num normalizedRandeMin = 0.0,
    num normalizedRangeMax = 1.0,
  ]) =>
      (normalizedRangeMax - normalizedRandeMin) *
          ((this - selftRangeMin) / (selfRangeMax - selftRangeMin)) +
      normalizedRandeMin;
}

const url =
    "https://media.istockphoto.com/id/1470130937/photo/young-plants-growing-in-a-crack-on-a-concrete-footpath-conquering-adversity-concept.webp?b=1&s=170667a&w=0&k=20&c=IRaA17rmaWOJkmjU_KD29jZo4E6ZtG0niRpIXQN17fc=";

class AnimationAndScrollHookExample extends HookWidget {
  const AnimationAndScrollHookExample({super.key});

  @override
  Widget build(BuildContext context) {
    final opacity = useAnimationController(
        duration: const Duration(seconds: 1),
        initialValue: 1.0,
        lowerBound: 0.0,
        upperBound: 1.0);
    final size = useAnimationController(
        duration: const Duration(seconds: 1),
        initialValue: 1.0,
        lowerBound: 0.0,
        upperBound: 1.0);
    final controller = useScrollController();
    useEffect(
      () {
        controller.addListener(() {
          final newOpacity = max(300 - controller.offset, 0.0);
          final normalized = newOpacity.normalize(0.0, 300).toDouble();
          opacity.value = normalized;
          size.value = normalized;
        });
        return null;
      },
      [controller],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Hook"),
      ),
      body: Column(
        children: [
          SizeTransition(
            sizeFactor: size,
            axis: Axis.vertical,
            axisAlignment: -1,
            child: FadeTransition(
              opacity: opacity,
              child: Image.network(
                url,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  controller: controller,
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Text(
                      "Person $index",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
