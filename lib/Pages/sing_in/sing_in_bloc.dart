import 'package:bloc/bloc.dart';

import 'sing_in_event.dart';
import 'sing_in_state.dart';

class SingInBloc extends Bloc<SingInEvent, SingInState> {
  SingInBloc() : super(SingInState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<SingInState> emit) async {
    emit(state.clone());
  }
}
