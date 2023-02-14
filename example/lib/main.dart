import 'package:easy_internet_checker/easy_internet_checker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ConnectivityWrapper(
        disableInteraction: true,
        offlineWidgetTextAlign: TextAlign.center,
        offlineWidgetColor: Colors.amber,
        offlineWidgetMessageStyle:
            const TextStyle(color: Colors.black54, fontSize: 18),
        containerAlignment: Alignment.topCenter,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              print('Pressed');
            },
            child: const Text('submit'),
          ),
        ),
      ),
    );
  }
}
