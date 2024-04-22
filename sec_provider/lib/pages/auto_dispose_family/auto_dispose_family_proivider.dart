import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends Equatable {
  final int count;
  const Counter({
    required this.count,
  });

  @override
  String toString() => 'Counter(count: $count)';

  @override
  List<Object> get props => [count];
}

final counterProvider = Provider.autoDispose.family<int, Counter>(
  (ref, c) {
    ref.onDispose(() {
      print('[CounterProvider($c)] dispose');
    });

    return c.count;
  },
);

final counterProvider2 = Provider.autoDispose.family<int, Counter>(
  (ref, c) {
    print('[CounterProvider($c)] created');
    ref.onDispose(() {
      print('[CounterProvider($c)] dispose');
    });
    return c.count;
  },
);

// final autoDisposeFamilyHelloProvider =
//     Provider.autoDispose.family<String, String>((ref, name) {
//   print('[autoDisposeFamilyHelloProvider($name)] create');
//   ref.onDispose(() {
//     print('[autoDisposeFamilyHelloProvider($name)] dispose');
//   });
//   return 'Hello $name';
// });



final autoDisposeFamilyHelloProvider = Provider.family<String,String >((ref,name ) {
  ref.onDispose(() {
    print('[autoDisposeFamilyHelloProvider($name)] dispose');
  });
  return 'Hello $name';
});
