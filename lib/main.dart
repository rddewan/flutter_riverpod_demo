import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/number_change_notifier.dart';
import 'package:flutter_riverpod_demo/screen/number_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const NumberScreen(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);  

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    debugPrint('---Rebuild----');
       
    return Scaffold(
      appBar: AppBar(        
        title: Text(widget.title),
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
                final state = ref.watch(numberChangeNotifierProvider);

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
            onPressed: ref.read(numberChangeNotifierProvider.notifier).decrement ,
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ), 
          FloatingActionButton(
            onPressed: ref.read(numberChangeNotifierProvider.notifier).increment ,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), 
        ],
      )
    );
  }
}
