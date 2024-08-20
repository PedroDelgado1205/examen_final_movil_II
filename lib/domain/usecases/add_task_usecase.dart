import '../entities/task.dart';

// Clase que maneja la lógica para agregar una tarea.
class AddTaskUseCase {
  final List<Task> taskList; // Lista de tareas donde se añadirán las nuevas tareas.

  // Constructor que recibe la lista de tareas.
  AddTaskUseCase(this.taskList);

  // Función para agregar una tarea a la lista.
  void call(Task task) {
    taskList.add(task); // Añade la tarea a la lista.
  }
}
