import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_with_riverpod/features/add_tasks/create_task.dart';
import 'package:task_manager_with_riverpod/features/view_tasks/components/Tasks.dart';
import 'package:task_manager_with_riverpod/features/view_tasks/components/no_data.dart';
import 'package:task_manager_with_riverpod/features/providers/task_provider.dart';

//convert StatelessWidget to ConsumerWidget
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override //add WidgetRef ref
  Widget build(BuildContext context, WidgetRef ref) {
    //listen to task list from the provider
    final taskList = ref.watch(taskProvider);

    Widget screenContent () {
      if(taskList.isEmpty){
        //if empty
        return NoData();
      } else {
        //if not empty
        return Tasks();
      }
    }

    return Scaffold(
      body: screenContent(),
     appBar: AppBar(title: Text('Home'),
     actions: [
       IconButton(onPressed: () {
         //navigate to create task
         Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CreateTask()));
       }, icon: Icon(Icons.add))
     ],
     )
     );
  }
}
