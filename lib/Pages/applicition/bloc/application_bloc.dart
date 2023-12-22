import 'package:flutter_bloc/flutter_bloc.dart';

import 'application_event.dart';
import 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState()) {
    on<TriggerAppEvent>(_init);
  }

  void _init(TriggerAppEvent event, Emitter<ApplicationState> emit) async {
    emit(ApplicationState(index: event.index));
  }
}
