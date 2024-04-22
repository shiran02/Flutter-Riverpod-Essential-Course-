import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'basic_provider.g.dart';

// final helloProvider = Provider<String>((ref) {
//   ref.onDispose(() {
//     print('[worldProvider] dispose');
//   });
//   return 'Hello';
// });

// final worldProvider = Provider((ref) {
//   ref.onDispose(() {
//     print('[worldProvider] dispose');
//   });
//   return 'world';
// });

@Riverpod(keepAlive: true)
String hello(HelloRef ref) {
  ref.onDispose(() {
    print('[worldProvider] dispose');
  });
  return 'Hello';
}

@Riverpod(keepAlive: true)
String world(WorldRef ref) {
  ref.onDispose(() {
    print('[worldProvider] dispose');
  });
  return 'world';
}
