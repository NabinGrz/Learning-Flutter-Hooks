import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension CompactMap<T> on Iterable<T?> {
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(transform ?? (e) => e).where((e) => e != null).cast();
}

const url =
    "https://media.istockphoto.com/id/1470130937/photo/young-plants-growing-in-a-crack-on-a-concrete-footpath-conquering-adversity-concept.webp?b=1&s=170667a&w=0&k=20&c=IRaA17rmaWOJkmjU_KD29jZo4E6ZtG0niRpIXQN17fc=";

class MemoizedAndFutureHookExample3 extends HookWidget {
  const MemoizedAndFutureHookExample3({super.key});

  @override
  Widget build(BuildContext context) {
    final futureOfImage = NetworkAssetBundle(Uri.parse(url))
        .load(url)
        .then((data) => data.buffer.asUint8List())
        .then((data) => Image.memory(data));
    //* useFuture doesnot persist the future in memory
    //* useMemoized allows caching of complex objects, will cache
    final memoized = useMemoized(() =>
        futureOfImage); //* This is caching the future of image, so that it doesnot re-download again
    final snapshot =
        useFuture(memoized); //* Consuming the future which is cached

    //!Note: Directly providing the 'futureOfImage' to 'useFuture' will trigger a infinite loop of downloading and results in flickering of UI

    return Scaffold(
      appBar: AppBar(
        title: const Text("Memoized and Future Hook"),
      ),
      body: Column(
        children:
            [snapshot.hasData ? snapshot.data! : null].compactMap().toList(),
      ),
    );
  }
}
