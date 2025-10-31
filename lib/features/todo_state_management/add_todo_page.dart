import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tut/features/todo_state_management/bloc/todo_bloc.dart';
// import 'package:flutter_bloc_tut/features/todo_state_management/cubit/todo_cubit.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final todoTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final todoCubit = BlocProvider.of<TodoCubit>(context);
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Add Todo')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: todoTitleController,
              decoration: const InputDecoration(hintText: 'Title'),
              onEditingComplete: () {
                todoBloc.add(AddTodo(title: todoTitleController.text.trim()));
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                todoBloc.add(AddTodo(title: todoTitleController.text.trim()));
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
