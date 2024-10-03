import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainning/screen/bloc_screen/bloc/counter_cubit.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({super.key});

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  late CounterCubit counterCubit;

  @override
  void initState() {
    counterCubit = CounterCubit();
    super.initState();
  }

  @override
  void dispose() {
    counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Divider(
                color: Colors.red,
              ),
              const Text('BlocListener'),
              BlocListener(
                bloc: counterCubit,
                listener: (BuildContext context, state) {
                  print("BlocListener: $state");
                },
                child: Text('Random : ${Random().nextInt(10)}'),
              ),
              const Divider(
                color: Colors.red,
              ),
              const Text('BlocBuilder'),
              BlocBuilder<CounterCubit, int>(
                bloc: counterCubit,
                builder: (context, state) {
                  return Text('$state');
                },
              ),
              const Divider(
                color: Colors.red,
              ),
              const Text('BlocConsumer'),
              BlocConsumer(
                bloc: counterCubit,
                listener: (BuildContext context, state) {
                  print("BlocConsumer: $state");
                },
                builder: (BuildContext context, Object? state) {
                  return Text('$state');
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    key:
                        const Key('counterView_increment_floatingActionButton'),
                    child: const Icon(Icons.add),
                    onPressed: () => counterCubit.increment(),
                  ),
                  const SizedBox(height: 8),
                  FloatingActionButton(
                    key:
                        const Key('counterView_decrement_floatingActionButton'),
                    child: const Icon(Icons.remove),
                    onPressed: () => counterCubit.decrement(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
