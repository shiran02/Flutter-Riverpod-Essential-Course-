import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/pages/users/user_detail_page.dart';
import 'package:future_provider/pages/users/user_providers.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);
    print(userList);

    print(
        'isLoading: ${userList.isLoading} , isRefreshing: ${userList.isRefreshing},isLoading:${userList.isReloading}');

    print('hasValue: ${userList.hasValue} , hasError : ${userList.hasError}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: userList.when(
        data: (data) {
          return RefreshIndicator(
            color: Colors.red,
            onRefresh: () async {
              ref.invalidate(userListProvider);
            },
            child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final user = data[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return UserDetailPage(userId: user.id);
                      }));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(user.id.toString()),
                      ),
                      title: Text(user.name),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: data.length),
          );
        },
        error: (e, stackTrace) {
          return Text(
            e.toString(),
            style: TextStyle(fontSize: 20, color: Colors.red),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
