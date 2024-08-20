import 'package:flutter/material.dart';

// Pantalla de diálogo para agregar una nueva tarea.
class AddTaskScreen extends StatefulWidget {
  final Function(String, String) onAddTask; // Función que se ejecutará cuando se agregue una nueva tarea.

  const AddTaskScreen({super.key, required this.onAddTask});

  @override
  // ignore: library_private_types_in_public_api
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  // Controladores para manejar el texto del título y la descripción.
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Función para manejar el envío de la tarea.
  void _submit() {
    final title = _titleController.text;
    final description = _descriptionController.text;

    // Solo agregamos la tarea si ambos campos tienen texto.
    if (title.isNotEmpty && description.isNotEmpty) {
      widget.onAddTask(title, description); // Llama a la función pasada desde el widget padre.
      Navigator.of(context).pop(); // Cierra el cuadro de diálogo.
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Añadir tarea'), // Título del diálogo.
      content: Column(
        mainAxisSize: MainAxisSize.min, // Hace que la columna se ajuste al contenido.
        children: [
          TextField(
            controller: _titleController, // Conecta el campo de texto con su controlador.
            decoration: const InputDecoration(labelText: 'Tarea'), // Etiqueta para el campo de título.
            style: Theme.of(context).textTheme.titleLarge, // Estilo del texto para que se vea consistente con la app.
          ),
          TextField(
            controller: _descriptionController, // Conecta el campo de texto con su controlador.
            decoration: const InputDecoration(labelText: 'Descripcion'), // Etiqueta para el campo de descripción.
            style: Theme.of(context).textTheme.titleSmall, // Estilo del texto para la descripción.
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), // Cierra el diálogo sin hacer nada.
          child: const Text('Cancel'), // Botón para cancelar.
        ),
        ElevatedButton(
          onPressed: _submit, // Llama a la función _submit para agregar la tarea.
          child: const Text('Add'), // Botón para añadir la tarea.
        ),
      ],
    );
  }
}
