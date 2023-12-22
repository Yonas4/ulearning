import 'package:bloc/bloc.dart';

import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UserNameEvent>(_userNameEv);
    on<EmailEvent>(_emailNameEv);
    on<PasswordEvent>(_passwordNameEv);
    on<ConfirmPasswordEvent>(_conPasswordNameEv);
  }

  void _userNameEv(UserNameEvent event, Emitter<RegisterState> emit) {
    print(event.userName);
    emit(state.copyWith(userName: event.userName));
  }

  void _emailNameEv(EmailEvent event, Emitter<RegisterState> emit) {
    print(event.email);

    emit(state.copyWith(email: event.email));
  }

  void _passwordNameEv(PasswordEvent event, Emitter<RegisterState> emit) {
    print(event.password);

    emit(state.copyWith(password: event.password));
  }

  void _conPasswordNameEv(
      ConfirmPasswordEvent event, Emitter<RegisterState> emit) {
    print(event.confirmPassword);

    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
