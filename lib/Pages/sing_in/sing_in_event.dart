abstract class SingInEvent {
  const SingInEvent();
}

class EmailEvent extends SingInEvent {
  final String email;

  const EmailEvent(this.email);
}

class PasswordEvent extends SingInEvent {
  final String password;

  const PasswordEvent(this.password);
}
