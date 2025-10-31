part of 'todo_bloc.dart';

class TodoEvent {}

class AddTodo extends TodoEvent {
  final String title;
  AddTodo({required this.title});
}

class RemoveTodo extends TodoEvent {
  final Todo todo;
  RemoveTodo({required this.todo});
}
