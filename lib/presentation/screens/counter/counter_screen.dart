import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/providers.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'Counter Screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final isDarkMode = ref.watch(darkModeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter screen"),
          actions: [
            IconButton(
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onPressed: () {
                ref.read(darkModeProvider.notifier).update((state) => !state);
              },
            ),
          ],
        ),
        body: Center(
            child: Text(
          'Valor: $clickCounter',
          style: Theme.of(context).textTheme.titleLarge,
        )),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                ref.read(counterProvider.notifier).state++;
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 16,
            ),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () {
                if (clickCounter == 0) return;

                ref.read(counterProvider.notifier).state--;
              },
              child: const Icon(Icons.remove),
            ),
            const SizedBox(
              height: 16,
            ),
            FloatingActionButton(
              heroTag: "btn3",
              onPressed: () {
                ref.read(counterProvider.notifier).state = 0;
              },
              child: const Icon(Icons.replay_rounded),
            )
          ],
        ));
  }
}
