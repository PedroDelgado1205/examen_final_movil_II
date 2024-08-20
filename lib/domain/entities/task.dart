// Clase que representa una tarea.
class Task {
  final String title; // Título de la tarea.
  final String description; // Descripción de la tarea.
  bool isComplete; // Indica si la tarea está completada o no.

  // Constructor que inicializa una tarea con título, descripción y estado de completado opcional.
  Task({
    required this.title,
    required this.description,
    this.isComplete = false, // Por defecto, la tarea no está completada.
  });
}
