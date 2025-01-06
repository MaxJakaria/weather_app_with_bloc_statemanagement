import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc_statemanagement/core/theme/app_palate.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/widgets/button_widget.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/todo/presentation/cubit/todo_cubit.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/todo/presentation/widgets/text_field.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/todo/presentation/widgets/todo_text_form_field.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final todoTitleController = TextEditingController();
  final todoDiscriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void addTodo() {
    if (formKey.currentState!.validate()) {
      context.read<TodoCubit>().addTodo(
        todoTitleController.text.trim(),
        todoDiscriptionController.text.trim(),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
        backgroundColor: AppPalate.appBarColor,
      ),
      backgroundColor: AppPalate.backGroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TodoTextField(hintText: 'Title', controller: todoTitleController),

              SizedBox(height: 20),
              TodoTextFormField(
                hintText: 'Description',
                controller: todoDiscriptionController,
              ),

              const SizedBox(height: 20),

              ButtonWidget(
                buttonName: 'Add Todo',
                buttonColor1: AppPalate.gradient1,
                buttonColor2: AppPalate.gradient2,

                onPressed: () {
                  addTodo();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
