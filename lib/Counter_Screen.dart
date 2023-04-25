import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class CounterScreen extends StatelessWidget {
  // static CounterCubit get(context)=>BlocProvider.of(context);
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          if (state is CounterPlusState) {
            // print("it's Plus State ${state.counter}");
          }
          {
            if (state is CounterMinusState) {
              // print("it's Minus State ${state.counter}");
            }
          }
        },
        builder: (context, state) {
          CounterCubit x = CounterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Counter",
                style: TextStyle(fontSize: 25),
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        x.minus();
                      },
                      child:
                          const Text("Minus", style: TextStyle(fontSize: 30))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "${x.counter}",
                      style: const TextStyle(
                          fontSize: 100, fontWeight: FontWeight.w900),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        x.plus();
                      },
                      child: const Text(
                        "Plus",
                        style: TextStyle(fontSize: 30),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
