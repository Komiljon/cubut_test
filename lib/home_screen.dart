import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/home_cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeCubit>().updateInfo();
        },
        child: const Icon(Icons.add),
      ),
      body: Column(children: [
        SizedBox(
          height: 350,
          child: BlocBuilder<HomeCubit, HomeCubitState>(builder: (context, state) {
            return state.maybeMap(
                init: (initState) {
                  return ListView.builder(
                      itemCount: initState.productItems.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(16),
                          child: Text(initState.productItems[index] ?? ''),
                        );
                      });
                },
                orElse: () => const SizedBox());
          }),
        )
      ]),
    );
  }
}
