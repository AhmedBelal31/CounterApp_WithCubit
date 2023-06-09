import 'package:bloc/bloc.dart';
import 'package:counter_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(InitialStates());
  int counter = 1;

  static CounterCubit get(context) {
    return BlocProvider.of(context);
  }

  void minus() {
    counter--;
    emit(CounterMinusState(counter));
    // print(counter);
  }

  void plus() {
    counter++;
    emit(CounterPlusState(counter));
    // print(counter);
  }
}
