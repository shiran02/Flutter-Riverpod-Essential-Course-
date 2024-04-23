import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticker_provider.g.dart';

//not using code genaration -----------------------
// id we create provider manually it create keepALive ---
// but we create using code genarater its not Keep Alive

// final tickerProvider = StreamProvider<int>((ref) {
//   ref.onDispose(() {
//     print('[TickerProvider] Dispose');
//   });
//   return Stream.periodic(const Duration(seconds: 1), (t) => t + 1).take(60);
// });

// using code genaration ------------------------------

@riverpod
Stream<int> ticker(TickerRef ref) {
  ref.onDispose(() {
    print('[TickerProvider] Dispose');
  });
  return Stream.periodic(const Duration(seconds: 1), (t) => t + 1).take(60);
}
