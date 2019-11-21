import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_test/counter_event.dart';
import 'package:flutter_bloc_test/counter_state.dart';


// Define what's come in and out for Bloc<>
class CounterBloc extends Bloc<CounterEvent, int> {

  //Good tip: Instead add putting uneccessary codes in the UI main.dart there,
  // you can call the dispatch code here using methods to make the dispatch simpler
  // For example:
  void onIncrement(){
    dispatch(IncrementEvent());
  }

  void onDecrement() {
    dispatch(DecrementEvent());
  }



  // Remember to change this initialState to your State.initial() method
  @override
  int get initialState => 0;

  // Make your method become async generator (which means async*)
  // yield keyword will emits a new value from your Stream ***
  @override
  Stream<int> mapEventToState(
      // You don't have to mention currentState as the
      // Bloc class overrided this value so you can use this value automatically
//       CounterState currentState,
      CounterEvent event,) async* {
    print('State management!');
    if (event is IncrementEvent) {
      print('IncrementEvent');
      yield currentState + 1;
    } else if (event is DecrementEvent) {
      print('DecrementEvent');
      yield currentState - 1;
    }
  }
}
