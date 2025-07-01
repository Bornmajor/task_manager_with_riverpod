import 'package:flutter/material.dart';
import 'package:task_manager_with_riverpod/features/add_tasks/create_task.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  void navigateCreateTask(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => CreateTask()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/no_data.png', width: 200),
          SizedBox(height: 30),
          Text('No data', style: TextStyle(fontSize: 20)),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
              onPressed: () {
                navigateCreateTask(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.add), Text('Add')],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
