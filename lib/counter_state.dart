class CounterState { // Put your state here

// Video tutorial: https://www.youtube.com/watch?v=LeLrsnHeCZY
// update: You can't use the method showed in the video anymore...
// Need to use the method that I self developed in this project
  int counter;

  CounterState._();

  factory CounterState.initial() {

    // Create a factory to initialize the class with initial values
    // You can call the property in the class from here obviously 0.0
    // Don't straight declare the initial values from the property itself
    return CounterState._()..counter = 0;
  }
}