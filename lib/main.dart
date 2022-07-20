import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
      home: BlocProvider(
    create: (context) => CounterBloc(CounterState(0)),
    child: CounterScreen(),
  )));
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text("Counter")),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Text(
                    context.read<CounterBloc>().state.counter.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().decrement();
                  },
                  tooltip: 'decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().reset();
                },
                tooltip: 'reset',
                child: const Text('Reset'),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class CounterState {
  int counter;

  CounterState(this.counter);

  setCounter(int counter) => this.counter = counter;

  getCounter() => counter;
}

class CounterBloc extends Cubit<CounterState> {
  CounterBloc(super.initialState);

  void increment() {
    emit(CounterState(++state.counter));
  }

  void decrement() {
    if (state.counter > 0) {
      emit(CounterState(--state.counter));
    }
  }

  void reset() {
    emit(CounterState(state.counter = 0));
  }
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: CounterScreen(),
//   ));
// }
//
// class CounterScreen extends StatefulWidget {
//   @override
//   _CounterScreenState createState() => _CounterScreenState();
// }
//
// class _CounterScreenState extends State<CounterScreen> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   void _decrementCounter() {
//     setState(() {
//       if(_counter>0){
//         _counter--;
//       }
//     });
//   }
//
//   void _resetCounter() {
//     setState(() {
//       _counter=0;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Counter Example")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 FloatingActionButton(
//                   onPressed: _incrementCounter,
//                   tooltip: 'Increment',
//                   child: const Icon(Icons.add),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(60.0),
//                   child: Text(
//                     '$_counter',
//                     style: TextStyle(fontSize: 100),
//                   ),
//                 ),
//                 FloatingActionButton(
//                   onPressed: _decrementCounter,
//                   tooltip: 'decrement',
//                   child: const Icon(Icons.remove),
//                 ),
//               ],
//
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: FloatingActionButton(
//                 onPressed: _resetCounter,
//                 tooltip: 'reset',
//                 child: Text('Reset'),
//               ),
//             ),
//           ],
//
//         )
//
//
//       ),
//
//
//
//
//     );
//   }
// }
