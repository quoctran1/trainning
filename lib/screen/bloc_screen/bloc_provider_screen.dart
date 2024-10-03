import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainning/screen/bloc_screen/bloc/counter_cubit.dart';

class BlocProviderScreen extends StatefulWidget {
  const BlocProviderScreen({super.key});

  @override
  State<BlocProviderScreen> createState() => _BlocProviderScreenState();
}

class _BlocProviderScreenState extends State<BlocProviderScreen> {
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
    return BlocProvider(
      create: (context) => counterCubit,
      // child: const CounterView(),
      child: const CounterViewSecond(),
    );
  }
}

class CounterView extends StatelessWidget {
  /// {@macro counter_view}
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text('BlocProvider inherited: $state',
                style: textTheme.displayMedium);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            tooltip: 'we',
            heroTag: '2',
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            tooltip: '1',
            heroTag: '4',
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}

class CounterViewSecond extends StatefulWidget {
  /// {@macro counter_view}
  const CounterViewSecond({super.key});

  @override
  State<CounterViewSecond> createState() => _CounterViewSecondState();
}

class _CounterViewSecondState extends State<CounterViewSecond> {
  late CounterCubit counterCubit;

  @override
  void initState() {
    super.initState();
    counterCubit = BlocProvider.of<CounterCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          bloc: counterCubit,
          builder: (context, state) {
            return Text('BlocProvider instance:$state');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            tooltip: 'we',
            heroTag: '2',
            key: const Key('counterView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => counterCubit.increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            tooltip: '1',
            heroTag: '4',
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => counterCubit.decrement(),
          ),
        ],
      ),
    );
  }
}
