import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class AnotherCounter extends _$AnotherCounter {
  @override
  int build() {
    print('[autoDisposeCounterProvier] initialized');

    ref.onDispose(() {
      print('[autoDisposeCounterProvier] disposed');
    });

    ref.onCancel(() {
      print('[autoDisposeCounterProvier] cancelled');
    });

    ref.onResume(() {
      print('[autoDisposeCounterProvier] resumed');
    });

    ref.onAddListener(() {
      print('[autoDisposeCounterProvier] listener Added');
    });

    ref.onRemoveListener(() {
      print('[autoDisposeCounterProvier] listener removed');
    });

    return 10;
  }

  void increment() => state += 10;
}

@riverpod
class AutoDisposeCounter extends _$AutoDisposeCounter {
  @override
  int build() {
    print('[autoDisposeCounterProvier] initialized');

    ref.onDispose(() {
      print('[autoDisposeCounterProvier] disposed');
    });

    ref.onCancel(() {
      print('[autoDisposeCounterProvier] cancelled');
    });

    ref.onResume(() {
      print('[autoDisposeCounterProvier] resumed');
    });

    ref.onAddListener(() {
      print('[autoDisposeCounterProvier] listener Added');
    });

    ref.onRemoveListener(() {
      print('[autoDisposeCounterProvier] listener removed');
    });

    return 0;
  }

  void increment() => state++;
}
