import 'package:bloc/bloc.dart';

import 'sing_in_event.dart';
import 'sing_in_state.dart';

class SingInBloc extends Bloc<SingInEvent, SingInState> {
  SingInBloc() : super(SingInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SingInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SingInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
