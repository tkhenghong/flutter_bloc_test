import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '2ndpage.dart';
import 'counter_bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

void main() {
//  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      bloc: _counterBloc,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'Flutter Demo Testing Page',),
        routes: {
          "next_page": (_) => new NextPage()
        },
      ),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Wrap your  page body with BlocBuilder and use state(import CounterState)
      // To display the real time values from the state
      body: BlocBuilder(
          bloc: _counterBloc,
          builder: (BuildContext context, int count) {
            print("Run here?");
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.display1,
                  ),
                  MaterialButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('next_page'),
                    child: Text('Next page'),
                  )
                ],
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
