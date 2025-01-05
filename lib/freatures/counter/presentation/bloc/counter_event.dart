part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

final class Increment extends CounterEvent {}

final class Decrement extends CounterEvent {}

final class Reset extends CounterEvent {}
