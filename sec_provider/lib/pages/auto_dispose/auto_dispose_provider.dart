import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auto_dispose_provider.g.dart';

// final autoDisposeHelloProvider = Provider.autoDispose<String>((ref) {
//   ref.onDispose(() {
//     print('[autoDisposeHelloProvider] dispose');
//   });
//   return 'Hello';
// });

@Riverpod(keepAlive: true)
String autoDisposeHello(AutoDisposeHelloRef ref) {
  ref.onDispose(() {
    print('[autoDisposeHelloProvider] dispose');
  });
  return 'Hello';
}
