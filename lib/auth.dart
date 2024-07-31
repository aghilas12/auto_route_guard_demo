import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthService {
  AuthState get state;
}

class AuthCubit extends Cubit<AuthState> implements AuthService {
  AuthCubit() : super(AuthState.loggedOut);

  void login() => emit(AuthState.loggedIn);

  void logout() => emit(AuthState.loggedOut);
}

enum AuthState {
  loggedIn,
  loggedOut,
  ;
}
