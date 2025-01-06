import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/todo/domain/entities/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title, String description) {
    final todo = Todo(
      name: title,
      description: description,
      createdAt: DateTime.now(),
    );
    /*final updateTodos = List<Todo>.from(state)..add(todo);
    emit(updateTodos);
    or
    state.add(todo);
    emit([...state]);
    or
    */
    emit([...state, todo]);
  }
}
