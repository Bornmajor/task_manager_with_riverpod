import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_with_riverpod/features/providers/task_provider.dart';

class Tasks extends ConsumerWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //listent to updates
    final taskList = ref.watch(taskProvider);

    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (_, index) {
        final task = taskList[index];

        return Card(
          margin: const EdgeInsets.all(8),
          child: Padding(
           padding: const EdgeInsets.all(8.0),
           child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(task.title),
              TextButton(
                onPressed: () {
                  //delete task using provider
                  ref.read(taskProvider.notifier).removeTask(task.id);
                },
                child: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
          )
         
        );
      },
    );
  }
}
