import 'package:flutter_riverpod/flutter_riverpod.dart';

final autoDisposeFamilyConuterProvider =
    StateProvider.family.autoDispose<int, int>((ref, initialValue) {
  ref.onDispose(() {
    print('[autoDisposeFamilyConuterProvider($initialValue)] dispose');
  });
  return initialValue;
});
