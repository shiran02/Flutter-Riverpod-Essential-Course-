import 'package:future_provider/models/user.dart';
import 'package:future_provider/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

//rvp
part 'user_providers.g.dart';

// final userListProvider = FutureProvider.autoDispose<List<User>>((ref) async {
//   ref.onDispose(() {
//     print('[userListProvider] dispose');
//   });

//   final response = await ref.watch(dioProvider).get('/users');
//   final List userList = response.data;

//   final users = [for (final user in userList) User.fromJson(user)];

//   return users;
// });

//riverpodfuture
@riverpod
FutureOr<List<User>> userList(UserListRef ref) async {
  ref.onDispose(() {
    print('[userListProvider] dispose');
  });

  final response = await ref.watch(dioProvider).get('/users');
  final List userList = response.data;

  final users = [for (final user in userList) User.fromJson(user)];

  return users;
}

// final userDetailProvider =
//     FutureProvider.family.autoDispose<User, int>((ref, id) async {
//   ref.onDispose(() {
//     print('[userDetailProvider($id)] dispose');
//   });

//   final response = await ref.watch(dioProvider).get('/users/$id');
//   final user = User.fromJson(response.data);

//   return user;
// });

// -------------------------------------------------
//create family provider using code genarating
//rvf
@riverpod
FutureOr<User> userDetail(UserDetailRef ref, int id) async {
  ref.onDispose(() {
    print('[userDetailProvider($id)] dispose');
  });

  final response = await ref.watch(dioProvider).get('/users/$id');
  final user = User.fromJson(response.data);

  return user;
}
