import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginSubmit>((event, emit) {
      emit(state.copyWith(isLoggedIn: true));
    });
    on<ToggleShowPassword>((event, emit) {
      emit(state.copyWith(showPassword: !state.showPassword));
    });
    on<SetEmail>((event, emit) {
      emit(state.copyWith(loginEmail: event.email));
    });
    on<SetPassword>((event, emit) {
      emit(state.copyWith(loginPassword: event.password));
    });
    on<Reset>((event, emit) {
      emit(const LoginState());
    });
  }
}
