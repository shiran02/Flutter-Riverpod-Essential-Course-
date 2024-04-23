import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyConuterProvider =
    StateProvider.family<int, int>((ref, initialValue) {
  ref.onDispose(() {
    print('[familyCounterProvider($initialValue)] dispose');
  });
  return initialValue;
});
