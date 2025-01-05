import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_with_bloc_statemanagement/core/theme/app_palate.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/cubit/counter_bloc.dart';
import 'package:weather_app_with_bloc_statemanagement/freatures/counter/presentation/pages/increment_decrement_page.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPalate.appBarColor,

        title: Text(title),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => IncrementDecrementPage()),
          );
        },
        tooltip: 'Operations',
        child: const Icon(Icons.line_axis),
      ),
    );
  }
}
