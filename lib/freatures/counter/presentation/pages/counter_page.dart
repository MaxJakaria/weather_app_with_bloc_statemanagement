import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc_statemanagement/core/theme/app_palate.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/cubit/counter_bloc.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/widgets/button_widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final counterBloc = CounterBloc();

  @override
  void dispose() {
    counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPalate.appBarColor,

        title: Text(widget.title),
      ),
      backgroundColor: AppPalate.backGroundColor,
      body: BlocBuilder<CounterBloc, CounterState>(
        bloc: counterBloc,
        builder: (context, state) {
          final counterText =
              (state is CounterValue) ? '${state.counter}' : '0';
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Text(
                  counterText,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
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
    );
  }
}
