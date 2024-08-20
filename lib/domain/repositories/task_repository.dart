import '../entities/task.dart';

// Interfaz que define las operaciones básicas para manejar tareas.
abstract class TaskRepository {
  // Método para agregar una tarea al repositorio.
  void addTask(Task task);

  // Método para eliminar una tarea del repositorio.
  void deleteTask(Task task);

  // Método para obtener la lista de todas las tareas.
  List<Task> getTasks();
}
