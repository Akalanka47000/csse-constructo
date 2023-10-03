part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool? isLoggedIn;
  final String? loginEmail;
  final String? loginPassword;
  final bool showPassword;

  const LoginState({this.isLoggedIn, this.loginEmail, this.loginPassword, this.showPassword = false});

  LoginState copyWith({bool? isLoggedIn, String? loginEmail, String? loginPassword, bool? showPassword}) => LoginState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      loginEmail: loginEmail ?? this.loginEmail,
      loginPassword: loginPassword ?? this.loginPassword,
      showPassword: showPassword ?? this.showPassword);

  @override
  List get props => [isLoggedIn, loginEmail, loginPassword, showPassword];
}
