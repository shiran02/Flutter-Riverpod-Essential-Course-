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

final autoDisposeFamilyTestHelloProvider =
    Provider.autoDispose.family<String, String>((ref, name) {
  print('[autoDisposeFamilyTestHelloProvider($name)] create');
  ref.onDispose(() {
    print('[autoDisposeFamilyTestHelloProvider($name)] dispose');
  });
  return 'Hello $name';
});
