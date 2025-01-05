part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int counter;
  const CounterState({required this.counter});
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(counter: 0);
}

class CounterValue extends CounterState {
  const CounterValue(int count) : super(counter: count);
}
