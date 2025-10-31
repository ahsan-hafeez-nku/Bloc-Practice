import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tut/model/todo_model.dart';

part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, List<Todo>> {
  TodoBloc() : super([]) {
    on<AddTodo>((event, emit) {
      final todo = Todo(title: event.title, createdAt: DateTime.now());
      emit([...state, todo]);
    });
    on<RemoveTodo>((event, emit) {
      emit([...state]..removeWhere((item) => item.title == event.todo.title));
    });
  }
}
