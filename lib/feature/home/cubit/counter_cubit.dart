import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}
