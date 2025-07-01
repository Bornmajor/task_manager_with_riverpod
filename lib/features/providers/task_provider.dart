import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_with_riverpod/models/task.dart';
import 'package:uuid/uuid.dart';

//uuid
const uuid = Uuid();

//StateNotifier to manage the task list
class TaskNotifier extends StateNotifier<List<Task>> {
  //Task constructor
  TaskNotifier() : super([]); //parent class constructor

  //methods
  //add task

  void addTask(String title) {
    //create task
    final task = Task(id: uuid.v4(), title: title);

    //add tasks to previous state
    state = [...state, task];
  }

  //remove a task
  void removeTask(String id) {
    //remove task
    state = state.where((task) => task.id != id).toList();
  }

  //edit tasks
  void editTask(String id, String newTitle) {
    //map throught tasks
    state =
        state.map((task) {
          if (task.id == id) {
            return Task(id: id, title: newTitle);
          }
          return task;
        }).toList();
  }


}
//StateNotifierProvider must live outside the class to be accessible globally.
 //Provider to expose the TaskNotifier
  final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
    return TaskNotifier();
  });