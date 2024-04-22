import 'package:flutter/material.dart';
import 'package:riverpod_freezed/models/person.dart';
import 'package:riverpod_freezed/pages/mutable_person_page.dart';
import 'package:riverpod_freezed/pages/person_pages.dart';
import 'widgets/custom_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freezed Data Class',
      debugShowCheckedModeBanner: false,
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
    // const person1 = Person(id: 1, name: "Shiran", email: "Shiran@gmail.com");
    // print(person1);
    // const person2 = Person(id: 1, name: "Shiran", email: "Shiran@gmail.com");
    // print(person1 == person2);
    // final person3 = person1.copyWith(id: 2, email: "Shiran@gmail.com");
    // print(person3);

    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: const [
            CustomButton(
              title: 'Person',
              child: PersonPage(),
            ),
            CustomButton(
              title: 'Mutable Person',
              child: MutablePersonPage(),
            ),
            // CustomButton(
            //   title: 'Collections',
            //   child: CollectionsPage(),
            // ),
            // CustomButton(
            //   title: 'Method',
            //   child: MethodPage(),
            // ),
          ],
        ),
      ),
    );
  }
}
