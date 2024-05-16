import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'dio_providers.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(BaseOptions(baseUrl: 'https://www.boredapi.com/api/activity'));
}
