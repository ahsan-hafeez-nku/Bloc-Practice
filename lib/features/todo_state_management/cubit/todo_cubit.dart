import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tut/model/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError('The title can not be empty');
      return;
    }
    final todo = Todo(title: title, createdAt: DateTime.now());
    emit([...state, todo]);
  }

  void removeToDo(Todo todo) {
    state.removeWhere((item) => item.title == todo.title);
    emit([...state]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    debugPrint('ToDo Changed: $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint("Error in Cubit: ${error.toString()}");
  }
}
