import '../entities/task.dart';

class AddTaskUseCase {
  final List<Task> taskList;

  AddTaskUseCase(this.taskList);

  void call(Task task) {
    taskList.add(task);
  }
}
