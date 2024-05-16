import 'dart:math';

import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:notifier_provider/models/activity.dart';
import 'package:notifier_provider/pages/enum_activity/enum_activity_provider.dart';
import 'package:notifier_provider/pages/enum_activity/enum_activity_state.dart';

class EnumActivityPage extends ConsumerStatefulWidget {
  const EnumActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EnumActivityPageState();
}

class _EnumActivityPageState extends ConsumerState<EnumActivityPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration.zero,
      () {
        ref.watch(enumActivityProvider.notifier).fetchActivity(activityType[0]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final activityState = ref.watch(enumActivityProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('EnumActivityNotifier'),
      ),
      body: switch (activityState.status) {
        ActivityStatus.initial => Center(
            child: Text(
              'Get Some Activity',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ActivityStatus.loading => Center(
            child: CircularProgressIndicator(),
          ),
        ActivityStatus.failure => Center(
            child: Text(
              activityState.error,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          ),
        ActivityStatus.sucess => ActivityWidget(
            activity: activityState.activity,
          ),
      },
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final randomNumber = Random().nextInt(activityType.length);
          ref
              .read(enumActivityProvider.notifier)
              .fetchActivity(activityType[randomNumber]);
        },
        label: Text(
          'New Activity',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({
    Key? key,
    required this.activity,
  }) : super(key: key);
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            activity.type,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Divider(),
          BulletedList(
            bullet: const Icon(
              Icons.check,
              color: Colors.green,
            ),
            listItems: [
              'activity: ${activity.activity}',
              'accessibility: ${activity.accessibility}',
              'participants: ${activity.participants}',
              'price: ${activity.price}',
              'key: ${activity.key}',
            ],
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
