import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc_statemanagement/core/theme/app_palate.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/widgets/button_widget.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/todo/presentation/cubit/todo_cubit.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/todo/presentation/widgets/text_field.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final todoTitleController = TextEditingController();
  final todoDiscriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Todo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TodoTextField(hintText: 'Todo', controller: todoTitleController),
            TodoTextField(
              hintText: 'Description',
              controller: todoDiscriptionController,
            ),
            const SizedBox(height: 20),
            ButtonWidget(
              buttonName: 'Add Todo',
              buttonColor1: AppPalate.gradient1,
              buttonColor2: AppPalate.gradient2,

              onPressed: () {
                context.read<TodoCubit>().addTodo(
                  todoTitleController.text.trim(),
                  todoDiscriptionController.text.trim(),
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
