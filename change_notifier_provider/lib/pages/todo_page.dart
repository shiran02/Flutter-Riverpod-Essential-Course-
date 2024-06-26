import 'package:change_notifier_provider/pages/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodosPage extends ConsumerWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider).todos;
    print(todos);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: Column(
        children: [
          const AddTodo(),
          const SizedBox(height: 20),
          Expanded(
              flex: 1,
              child: ListView(
                children: [
                  for (final todo in todos)
                    CheckboxListTile(
                      value: todo.completed,
                      onChanged: (value) {
                        ref.read(todosProvider.notifier).toggleTodo(todo.id);
                      },
                      title: Text(todo.desc),
                      secondary: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          ref.read(todosProvider.notifier).removeTodo(todo.id);
                        },
                      ),
                    )
                ],
              ))
        ],
      ),
    );
  }
}

class AddTodo extends ConsumerStatefulWidget {
  const AddTodo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoState();
}

class _AddTodoState extends ConsumerState<AddTodo> {
  final textcontroller = TextEditingController();

  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textcontroller,
      decoration: InputDecoration(labelText: "New Todo"),
      onSubmitted: (desc) {
        if (desc.isNotEmpty) {
          ref.read(todosProvider.notifier).addTodo(desc);
          textcontroller.clear();
        }
      },
    );
  }
}
