import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_with_riverpod/features/providers/task_provider.dart';

class CreateTask extends ConsumerStatefulWidget {
  //instiance creation
  const CreateTask({super.key});

  @override
  ConsumerState<CreateTask> createState() {
    return _CreateTaskState();
  }
}

class _CreateTaskState extends ConsumerState<CreateTask> {
  final _titleController = TextEditingController();

  //createtask
  void _createTask() {
    //check if its empty
    if (_titleController.text.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder:
            (context) => CupertinoAlertDialog(
              title: Text('Error'),
              content: Text('Title cannot be empty'),
            ),
      );
      return; //stop code on error
    }

    //create tasks
    ref.read(taskProvider.notifier).addTask(_titleController.text);

    //clear text
    _titleController.clear();

    //navigate back
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text('Add task')),
          ),
          const SizedBox(height: 30),
          FilledButton(
            child: Text('Add title'),
            onPressed: () {
              _createTask();
            },
          ),
        ],
      ),
      ),
      appBar: AppBar(title: Text('Create new tasks')),
    );
  }
}
