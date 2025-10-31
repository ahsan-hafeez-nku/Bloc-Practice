import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(AuthLoading(loading: true));
        final email = event.email;
        final password = event.password;
        if (password.length < 6) {
          return emit(
            AuthFailure(errorMessage: 'Password must be 6 characters long'),
          );
        }
        if (email == 'admin@gmail.com' && password == '123456') {
          await Future.delayed(const Duration(seconds: 3));
          return emit(AuthSuccess(message: "User successfully Logged in"));
        } else {
          await Future.delayed(const Duration(seconds: 3));
          return emit(AuthFailure(errorMessage: 'Invalid email or password'));
        }
      } catch (e) {
        return emit(AuthFailure(errorMessage: e.toString()));
      }
    });
  }
}
