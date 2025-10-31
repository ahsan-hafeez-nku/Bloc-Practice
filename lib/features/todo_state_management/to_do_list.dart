import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tut/features/todo_state_management/bloc/todo_bloc.dart';
// import 'package:flutter_bloc_tut/features/todo_state_management/cubit/todo_cubit.dart';
import 'package:flutter_bloc_tut/model/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    // final todoCubit = BlocProvider.of<TodoCubit>(context);
    final todoBloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: BlocBuilder<TodoBloc, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              if (todos.isEmpty) return const Text('No todos');
              final todo = todos[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.black,
                  title: Text(
                    todo.title,
                    style: TextStyle(color: Colors.white),
                  ),

                  subtitle: Text(
                    todo.createdAt.toString(),
                    style: TextStyle(color: Colors.white),
                  ),

                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.white),
                    onPressed: () => todoBloc.add(RemoveTodo(todo: todo)),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
