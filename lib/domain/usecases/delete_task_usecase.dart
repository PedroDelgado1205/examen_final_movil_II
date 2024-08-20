import '../entities/task.dart';

class DeleteTaskUseCase {
  final List<Task> taskList;

  DeleteTaskUseCase(this.taskList);

  void call(Task task) {
    taskList.remove(task);
  }
}
