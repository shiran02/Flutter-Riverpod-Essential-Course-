import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

// class Counter extends Notifier<int> {
//   @override
//   int build() {
//     ref.onDispose(() {
//       print('[countProvider] dispose');
//     });
//     return 0;
//   }

//   void increment() {
//     state++;
//   }
// }

// class Counter extends AutoDisposeNotifier<int> {
//   @override
//   int build() {
//     ref.onDispose(() {
//       print('[countProvider] dispose');
//     });
//     return 0;
//   }

//   void increment() {
//     state++;
//   }
// }

// class Counter extends FamilyNotifier<int, int> {
//   @override
//   int build(int arg) {
//     ref.onDispose(() {
//       print('[countProvider] dispose');
//     });
//     return arg;
//   }

//   void increment() {
//     state++;
//   }
// }

// class Counter extends AutoDisposeFamilyNotifier<int, int> {
//   @override
//   int build(int arg) {
//     ref.onDispose(() {
//       print('[countProvider] dispose');
//     });
//     return arg;
//   }

//   void increment() {
//     state++;
//   }
// }

// final counterProvider = NotifierProvider<Counter, int>(
//   () {
//     return Counter();
//   },
// );

//final counterProvider = NotifierProvider.autoDispose<Counter, int>(Counter.new);

// final counterProvider = NotifierProvider.family<Counter, int, int>(Counter.new);

// final counterProvider =
//     NotifierProvider.family.autoDispose<Counter, int, int>(Counter.new);

@riverpod
class Counter extends _$Counter {
  @override
  int build(int initialValue) {
    ref.onDispose(() {
      print('[countProvider] dispose');
    });
    return initialValue;
  }

  void increment() {
    state++;
  }
}
