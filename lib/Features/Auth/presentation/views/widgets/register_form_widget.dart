import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_password/Core/utils/app_router.dart';
import 'package:my_password/Core/utils/widgets/custom_button.dart';
import 'package:my_password/Features/Auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'basic_text_form_field.dart';
import 'password_difficulty_widget.dart';
import 'password_text_form_field.dart';
import 'strong_password_arguments_widget.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({
    super.key,
  });
  static final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    TextEditingController displayName = TextEditingController();
    TextEditingController email = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          BasicTextFormField(
            hintText: 'Taha Hassan',
            labelText: 'Display Name',
            controller: displayName,
            validate: (_) {
              _ = email.text;
              if (_.length <= 3) {
                return 'Display name should be more 3 letters ';
              } else {
                return null;
              }
            },
          ),
          BasicTextFormField(
            labelText: 'Email',
            hintText: 'examble@examble.com',
            controller: email,
            validate: (_) {
              _ = email.text;
              if (_.isEmpty) {
                return 'Write your email address';
              } else if (!_.contains('@') || !_.contains('.com')) {
                return 'Write correct email address';
              } else {
                return null;
              }
            },
          ),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              var cubit = BlocProvider.of<RegisterCubit>(context);
              return Column(
                children: [
                  PasswordTextFormField(
                    controller: password,
                    validate: (_) {},
                    onChanged: (_) {
                      BlocProvider.of<RegisterCubit>(context).passwordOnChanged(
                          context: context, formKey: formKey);
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  PasswordDifficultyWidget(
                    passwordDifficultyProportion:
                        cubit.passwordDifficultyProportion,
                    color: cubit.passwordDifficultyColor,
                    text: cubit.passwordDifficultyText,
                  ),
                  StrongPasswordArgumnetsWidget(
                    lenghtArg: cubit.lenghtArg,
                    lowAndUppCaseArg: cubit.lowAndUppCaseArg,
                    numArg: cubit.numArg,
                    specialMarkArg: cubit.specialMarkArg,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthButton(
                    controller: password,
                    view: AppRouter.kLoginView,
                    text: 'Have an account?',
                    textButtonText: 'Login',
                    buttonText: 'Register',
                    onPressed: () async {
                      await cubit.userRegister(
                        context: context,
                        auth: auth,
                        email: email.text,
                        password: password.text,
                        displayName: displayName.text,
                        formKey: formKey,
                      );
                      password.clear();
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
