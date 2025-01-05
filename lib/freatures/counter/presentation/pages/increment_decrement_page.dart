import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc_statemanagement/core/theme/app_palate.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/bloc/counter_bloc.dart';
// import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/cubit/counter_cubit.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/widgets/button_widget.dart';

class IncrementDecrementPage extends StatelessWidget {
  const IncrementDecrementPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPalate.appBarColor,
        title: const Text('Increment Decrement Page'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                // counterCubit.decrement();
                counterBloc.add(Decrement());
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),

            ButtonWidget(
              buttonName: 'Reset',
              buttonColor1: AppPalate.gradient1,
              buttonColor2: AppPalate.gradient2,
              onPressed: () {
                // counterCubit.reset();
                counterBloc.add(Reset());
              },
            ),

            FloatingActionButton(
              onPressed: () {
                // counterCubit.increment();
                counterBloc.add(Increment());
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
