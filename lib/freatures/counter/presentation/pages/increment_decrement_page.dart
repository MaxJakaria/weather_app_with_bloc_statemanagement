import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc_statemanagement/core/theme/app_palate.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/cubit/counter_bloc.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/widgets/button_widget.dart';

class IncrementDecrementPage extends StatelessWidget {
  const IncrementDecrementPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                counterBloc.decrement();
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),

            ButtonWidget(
              buttonName: 'Reset',
              buttonColor1: AppPalate.gradient1,
              buttonColor2: AppPalate.gradient2,
              onPressed: () {
                counterBloc.reset();
              },
            ),

            FloatingActionButton(
              onPressed: () {
                counterBloc.increment();
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
