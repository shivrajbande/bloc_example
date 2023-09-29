import 'package:bloc_project/variable_event.dart';
import 'package:bloc_project/variable_state.dart';
import 'package:bloc/bloc.dart';

class CounterBloc extends Bloc<IncrementEvent,UpdateState > {
  CounterBloc() : super(const UpdateState()) {

    on<VariableUpdateEvent>((event, emit) {
      emit(VariableUpdateState(x :event.x!+1));
    });
  }
}
