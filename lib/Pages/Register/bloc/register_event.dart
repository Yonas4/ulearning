abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameEvent extends RegisterEvent {
  final String userName;

  UserNameEvent(this.userName);
}

class EmailEvent extends RegisterEvent {
  final String email;

  EmailEvent(this.email);
}

class PasswordEvent extends RegisterEvent {
  final String password;

  PasswordEvent(this.password);
}

class ConfirmPasswordEvent extends RegisterEvent {
  final String confirmPassword;

  ConfirmPasswordEvent(this.confirmPassword);
}
