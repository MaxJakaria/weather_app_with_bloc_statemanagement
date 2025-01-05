import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final Increment _increment;
  final Decrement _decrement;
  final Reset _reset;

  CounterBloc({Increment? increment, Decrement? decrement, Reset? reset})
    : _increment = increment ?? Increment(),
      _decrement = decrement ?? Decrement(),
      _reset = reset ?? Reset(),
      super(CounterValue(count: 0)) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
    on<Reset>(_onReset);
  }

  void _onIncrement(Increment event, Emitter<CounterState> emit) {
    if (state is CounterValue) {
      final count = (state as CounterValue).count;
      emit(CounterValue(count: count + 1));
    }
  }

  void _onDecrement(Decrement event, Emitter<CounterState> emit) {
    if (state is CounterValue) {
      final count = (state as CounterValue).count;
      if (count > 0) {
        emit(CounterValue(count: count - 1));
      }
    }
  }

  void _onReset(Reset event, Emitter<CounterState> emit) {
    emit(CounterValue(count: 0));
  }
}
