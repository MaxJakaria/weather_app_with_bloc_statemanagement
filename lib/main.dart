import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/bloc/counter_bloc.dart';
// import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/cubit/counter_cubit.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/pages/counter_page.dart';

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
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterPage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
