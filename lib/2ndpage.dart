import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class NextPage extends StatefulWidget {
//  final CounterBloc bloc;

//  NextPage({this.bloc});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new NextPageState();
  }
}

class NextPageState extends State<NextPage> {
//  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: BlocBuilder(
          bloc: _counterBloc,
          builder: (context, int counter) {
            return Center(
              child: Text(
                counter.toString(),
                style: TextStyle(fontSize: 20.0),
              ),
            );
          }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 1,
            // This method is considered annoying, recommend to dispatch them inside the bloc file itself
//            onPressed: () {
//              print('Increment!');
//              _counterBloc.dispatch(IncrementEvent());
//            },
            onPressed: () => _counterBloc.onIncrement(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            heroTag: 2,
            // This method is considered annoying, recommend to dispatch them inside the bloc file itself
//            onPressed: () {
//              print('Decrement!');
//              _counterBloc.dispatch(DecrementEvent());
//            },
            onPressed: () => _counterBloc.onDecrement(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }
}
