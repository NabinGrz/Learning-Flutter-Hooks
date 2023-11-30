import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SimpleHookExample2 extends HookWidget {
  const SimpleHookExample2({super.key});

  @override
  Widget build(BuildContext context) {
    //** These two hooks will not rebuild when hot reload, because, internally its comparing/holding the instances.
    final controller = useTextEditingController();
    final text = useState('');

    //** This hook might get rebuild when hot reload, because it has nothing to identify, its just a void call back
    //** So, we have to provide a key to make sure that, as long as the key is same do not call the effect again.
    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;
    }, [
      controller, //** Key or identifier,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          Text("You have typed: ${text.value}")
        ],
      ),
    );
  }
}
