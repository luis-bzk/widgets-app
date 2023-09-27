import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const name = 'Counter Screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter screen"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Valor: $counter',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}
