import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'basic_provider.dart';

// class BasicPage extends StatelessWidget {
//   const BasicPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Provider'),
//       ),
//       body: Center(child: Consumer(
//         builder: (context, ref, child) {
//           final hello = ref.watch(helloProvider);
//           final world = ref.watch(worldProvider);

//           return Text(
//             '$hello $world',
//             style: Theme.of(context).textTheme.headlineLarge,
//           );
//         },
//       )),
//     );
//   }
// }

// class BasicPage extends ConsumerWidget {
//   const BasicPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final hello = ref.watch(helloProvider);
//     final world = ref.watch(worldProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Provider'),
//       ),
//       body: Center(
//           child: Text(
//         '$hello $world',
//         style: Theme.of(context).textTheme.headlineLarge,
//       )),
//     );
//   }
// }

class BasicPage extends ConsumerStatefulWidget {
  const BasicPage({super.key});

  @override
  ConsumerState<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends ConsumerState<BasicPage> {
  @override
  Widget build(BuildContext context) {
    final hello = ref.watch(helloProvider);
    final world = ref.watch(worldProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Text(
          '$hello $world',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
