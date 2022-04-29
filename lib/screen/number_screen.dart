
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/controller/number_controller.dart';

class NumberScreen extends ConsumerStatefulWidget {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends ConsumerState<NumberScreen> {
  int _generatedNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number'),
      ),
      body: Center(       
        child: Column(         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(             
              builder: (context, ref, child) {
                 debugPrint('---Consumer Rebuild----');
                final state = ref.watch(numberControllerProvider);
                _generatedNumber = state.generatedNumber;

                return Text(
                  '${state.generatedNumber}',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           FloatingActionButton(
            onPressed:  () {
              _generatedNumber--;
              ref.read(numberControllerProvider.notifier).decrement(_generatedNumber);
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ), 
          FloatingActionButton(
            onPressed:  () {
              _generatedNumber++;
              ref.read(numberControllerProvider.notifier).increment(_generatedNumber);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), 
        ],
      )
    );
  }
}