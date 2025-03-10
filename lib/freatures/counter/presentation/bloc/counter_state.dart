part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class CounterValue extends CounterState {
  final int count;
  CounterValue({required this.count});
}
