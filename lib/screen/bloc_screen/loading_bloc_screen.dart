import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainning/screen/bloc_screen/loading_bloc/loading_bloc.dart';
import 'package:trainning/screen/bloc_screen/loading_bloc/loading_bloc_state.dart';
import 'package:trainning/screen/list_view_screen/generic_list_view.dart';

class LoadingBlocScreen extends StatefulWidget {
  const LoadingBlocScreen({super.key});

  @override
  State<LoadingBlocScreen> createState() => _LoadingBlocScreenState();
}

class _LoadingBlocScreenState extends State<LoadingBlocScreen> {
  late LoadingCubit loadingCubit;
  List<String> listData = [];

  @override
  void initState() {
    loadingCubit = LoadingCubit();
    super.initState();
  }

  @override
  void dispose() {
    loadingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocBuilder(
            bloc: loadingCubit,
            buildWhen: (previous, current) => current is GetDataState,
            builder: (BuildContext context, state) {
              return Text(state.toString());
            },
          ),
          BlocListener(
            bloc: loadingCubit,
            listenWhen: (previous, current) => current is ErrorState,
            listener: (BuildContext context, Object? state) {
              if (state is ErrorState) {
                final snackBar = SnackBar(
                  content: const Text('Error!'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Handle undo action
                    },
                  ),
                  duration: const Duration(seconds: 3),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const Divider(
              height: 2,
              color: Colors.red,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          BlocConsumer(
            bloc: loadingCubit,
            listener: (BuildContext context, state) {
              if (state is GetDataState) {
                listData = state.listData;
              }
            },
            builder: (BuildContext context, Object? state) {
              return Expanded(
                child: GenericListView(
                  data: listData,
                  buildItem: (int index, String data) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data),
                      ],
                    );
                  },
                ),
              );
            },
          ),
          BlocConsumer(
            bloc: loadingCubit,
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, Object? state) {
              return LoadingButton(
                isLoading: state is LoadingState,
                onTap: () {
                  loadingCubit.getData();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class LoadingButton extends StatelessWidget {
  final bool isLoading;
  final Function onTap;

  const LoadingButton(
      {super.key, required this.isLoading, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  )
                : const Text(
                    'Press',
                    textAlign: TextAlign.center,
                  )
          ],
        ),
      ),
    );
  }
}
