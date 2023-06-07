part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LginSuccess extends LoginState {}

class LoginFailure extends LoginState {}

class LoginLoading extends LoginState {}
