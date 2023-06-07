part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final TextEditingController controller;
  final GlobalKey<FormState> key;

  RegisterSuccess(this.controller, this.key);
}
