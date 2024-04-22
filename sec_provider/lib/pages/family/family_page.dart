import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sec_provider/pages/family/family_provider.dart';

class FamilyPage extends ConsumerWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloShiran = ref.watch(familyHelloProvider(there: 'Shiran'));
    final helloKumarasingha =
        ref.watch(familyHelloProvider(there: 'kumarasingha'));
    return Scaffold(
      appBar: AppBar(
        title: const Text('FamilyProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(helloShiran, style: Theme.of(context).textTheme.headlineLarge),
            Text(helloKumarasingha,
                style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }
}
