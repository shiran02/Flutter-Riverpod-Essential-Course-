import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifier_provider/pages/counter/counter_page.dart';
import 'package:notifier_provider/pages/enum_activity/enum_activity_page.dart';
import 'package:notifier_provider/widgets/custom_widgets.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifier Provider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotifierProvider'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: const [
            CustomButton(
              title: 'Counter',
              child: CounterPage(),
            ),
            CustomButton(
              title: 'Counter',
              child: EnumActivityPage(),
            ),
          ],
        ),
      ),
    );
  }
}