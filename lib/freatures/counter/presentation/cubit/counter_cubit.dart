import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increment() {
    emit(CounterValue(state.counter + 1));
  }

  void decrement() {
    if (state.counter > 0) {
      emit(CounterValue(state.counter - 1));
    }
  }

  void reset() {
    emit(CounterInitial());
  }
}
