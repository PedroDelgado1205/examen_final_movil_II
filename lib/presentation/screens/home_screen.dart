import 'package:examen_final/presentation/screens/add_task_screen.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';
import '../../domain/usecases/add_task_usecase.dart';
import '../../domain/usecases/delete_task_usecase.dart';
import '../widgets/shared/task_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];
  late AddTaskUseCase _addTaskUseCase;
  late DeleteTaskUseCase _deleteTaskUseCase;

  @override
  void initState() {
    super.initState();
    _addTaskUseCase = AddTaskUseCase(_tasks);
    _deleteTaskUseCase = DeleteTaskUseCase(_tasks);
  }

  void _addTask(String title, String description) {
    setState(() {
      _addTaskUseCase.call(Task(title: title, description: description));
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      _deleteTaskUseCase.call(task);
    });
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) => AddTaskScreen(onAddTask: _addTask),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examen Final To-Do List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _tasks.isEmpty
            ? Center(
                child: Text('No hay tareas disponibles!!!\nPara agragar una tarea usa el +',
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
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
