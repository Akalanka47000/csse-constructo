part of 'login_bloc.dart';

class LoginEvent {
  const LoginEvent();
}

class LoginSubmit extends LoginEvent {}

class ToggleShowPassword extends LoginEvent {}

class SetEmail extends LoginEvent {
  final String email;
  const SetEmail(this.email);
}

class SetPassword extends LoginEvent {
  final String password;
  const SetPassword(this.password);
}

class Reset extends LoginEvent {}
