import 'package:examen_final/presentation/screens/add_task_screen.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/add_task_usecase.dart';
import '../../domain/usecases/delete_task_usecase.dart';
import '../widgets/shared/task_item.dart';

// La pantalla principal de la app, donde veremos nuestras tareas.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Lista privada para almacenar las tareas. Inicia vacía.
  final List<Task> _tasks = [];

  // Las variables para manejar los casos de uso de agregar y borrar tareas.
  late AddTaskUseCase _addTaskUseCase;
  late DeleteTaskUseCase _deleteTaskUseCase;

  @override
  void initState() {
    super.initState();
    // Inicializamos los casos de uso, pasándoles la lista de tareas.
    _addTaskUseCase = AddTaskUseCase(_tasks);
    _deleteTaskUseCase = DeleteTaskUseCase(_tasks);
  }

  // Función para agregar una tarea a la lista.
  void _addTask(String title, String description) {
    setState(() {
      _addTaskUseCase.call(Task(title: title, description: description));
    });
  }

  // Función para borrar una tarea de la lista.
  void _deleteTask(Task task) {
    setState(() {
      _deleteTaskUseCase.call(task);
    });
  }

  // Muestra un cuadro de diálogo para agregar una nueva tarea.
  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) => AddTaskScreen(onAddTask: _addTask),
    );
  }

  // Función para manejar el cambio de estado del checkbox de una tarea.
  void _handleCheckboxChanged(Task task, bool? isComplete) {
  setState(() {
    task.isComplete = isComplete ?? false; // Actualiza el estado de completado de la tarea.
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examen Final To-Do List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // Si no hay tareas, mostramos un mensaje amigable. Si hay, las mostramos en una lista.
        child: _tasks.isEmpty
            ? Center(
                child: Text(
                  'No hay tareas disponibles!!!\nPara agregar una tarea usa el +',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )
            : ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final task = _tasks[index];
                  return TaskItem(
                    task: task,
                    onDelete: () => _deleteTask(task), 
                    onCheckboxChanged: (bool? isComplete) => _handleCheckboxChanged(task, isComplete),// Se cambia el estado de la tarea
                  );
                },
              ),
      ),
      // Botón flotante para agregar una nueva tarea.
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
