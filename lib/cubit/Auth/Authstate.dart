abstract class AuthState {}

class AuthInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginFailerState extends AuthState {}

class RegisterLaodingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterFailerState extends AuthState {}

class LogoutSuccessState extends AuthState {}
