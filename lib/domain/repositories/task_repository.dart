import '../entities/task.dart';

abstract class TaskRepository {
  void addTask(Task task);
  void deleteTask(Task task);
  List<Task> getTasks();
}
