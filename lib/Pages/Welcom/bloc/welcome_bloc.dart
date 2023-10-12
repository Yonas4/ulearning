import 'package:bloc/bloc.dart';

import 'welcome_event.dart';
import 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<WelcomeState> emit) async {
    emit(state.clone());
  }
}
