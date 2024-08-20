import '../entities/task.dart';

// Clase que maneja la lógica para borrar una tarea.
class DeleteTaskUseCase {
  final List<Task> taskList; // Lista de tareas donde se eliminarán las tareas.

  // Constructor que recibe la lista de tareas.
  DeleteTaskUseCase(this.taskList);

  // Función que elimina una tarea de la lista.
  void call(Task task) {
    taskList.remove(task); // Quita la tarea especificada de la lista.
  }
}
