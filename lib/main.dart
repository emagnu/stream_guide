//  //
//  Import LIBRIARIES
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
//  Import FILES
//  PARTS
//  SIGNALS

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<double> controller = StreamController<double>();
  late StreamSubscription<double> streamSubscription;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stream Education'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                onPressed: () async* {
                  getDelayedRandiomValue().listen((value) {
                    debugPrint('Value from Stream: $value');
                  });
                },
                // onPressed: () async {
                //   var value1 = getDelayedRandiomValue();
                //   var value2 = getDelayedRandiomValue();
                //   // Stream the controller manages
                //   // Stream<double> stream = controller.stream;
                //   // streamSubscription = stream.listen((value) {
                //   //   debugPrint('Value from controller: $value');
                //   // });
                // },
                color: Colors.yellow,
                child: const Text('Subscribe'),
              ),
              const SizedBox(width: 5),
              MaterialButton(
                onPressed: () {
                  controller.add(10);
                },
                color: Colors.blue[200],
                child: const Text('Emit Value'),
              ),
              const SizedBox(width: 5),
              MaterialButton(
                onPressed: () {
                  streamSubscription.cancel();
                  // controller.close();
                },
                color: Colors.red[200],
                child: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<double> getDelayedRandiomValue() async* {
    var random = Random();
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield random.nextDouble();
    }
  }
  // Future<double> getDelayedRandiomValue() async {
  //   var random = Random();
  //   await Future.delayed(const Duration(seconds: 1));
  //   return random.nextDouble();
  // }
}
