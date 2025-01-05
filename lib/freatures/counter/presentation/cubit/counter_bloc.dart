import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterBloc extends Cubit<CounterState> {
  CounterBloc() : super(CounterInitial());

  void increment() {
    emit(CounterValue(state.counter + 1));
  }

  void decrement() {
    emit(CounterValue(state.counter - 1));
  }
}
