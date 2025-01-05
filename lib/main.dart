import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/bloc/counter_bloc.dart';
// import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/cubit/counter_cubit.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/todo/presentation/cubit/todo_cubit.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/todo/presentation/pages/add_todo_page.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/todo/presentation/pages/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => TodoCubit()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const CounterPage(title: 'Flutter Demo Home Page'),
        initialRoute: '/',
        routes: {
          '/': (_) => const TodoList(),
          '/add-todo': (_) => const AddTodoPage(),
        },
      ),
    );
  }
}
