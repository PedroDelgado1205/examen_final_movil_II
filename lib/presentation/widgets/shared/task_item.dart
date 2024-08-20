import 'package:flutter/material.dart';
import '../../../domain/entities/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onCheckboxChanged; // Función para manejar el cambio del estado del checkbox.
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.task,
    required this.onCheckboxChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: const Color(0xFFB3B3B3), // Color para resaltar la tarjeta de la tarea.
      ),
      child: Row(
        children: <Widget>[
          // Checkbox para mostrar si la tarea está completada.
          Checkbox(
            value: task.isComplete, // Estado del checkbox según si la tarea está completada.
            onChanged: onCheckboxChanged, // Llama a la función para actualizar el estado.
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  task.title, // Título de la tarea.
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 4.0),
                Text(
                  task.description, // Descripción de la tarea.
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.delete, // Icono de papelera para eliminar la tarea.
              color: Colors.red[500],
            ),
            onPressed: onDelete, // Función para eliminar la tarea.
          ),
        ],
      ),
    );
  }
}
