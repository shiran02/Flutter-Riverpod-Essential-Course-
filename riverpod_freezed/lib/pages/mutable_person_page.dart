import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_freezed/models/mutable_person.dart';

class MutablePersonPage extends StatelessWidget {
  const MutablePersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final person1 =
        MutablePerson(id: 1, name: "Shiran", email: "Shiran@gmail.com");
    person1.name = "Shiran";
    person1.email = "Shiran@gmail.com";
    print(person1);

    return Scaffold(
      appBar: AppBar(
        title: Text("Mutable Person"),
      ),
    );
  }
}
