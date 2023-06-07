import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_password/Core/utils/app_router.dart';
import 'package:my_password/Core/utils/widgets/custom_button.dart';
import 'package:my_password/Features/Auth/presentation/views/widgets/password_text_form_field.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import 'basic_text_form_field.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var auth = FirebaseAuth.instance;
    return Form(
      key: formKey,
      child: Column(
        children: [
          BasicTextFormField(
            controller: email,
            hintText: 'examble@examble.com',
            labelText: 'Email',
            validate: (_) {
              if (email.text.isEmpty) {
                return 'Email field can\'t be empty';
              } else {
                return null;
              }
            },
          ),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return PasswordTextFormField(
                controller: password,
                validate: (_) {
                  if (password.text.isEmpty) {
                    return 'Password field can\'t be empty';
                  } else {
                    return null;
                  }
                },
                onChanged: (_) {
                  BlocProvider.of<LoginCubit>(context).rebuildScreen();
                },
              );
            },
          ),
          const SizedBox(
            height: 80,
          ),
          AuthButton(
            view: AppRouter.kRegisterView,
            text: 'Don\'t have account?',
            textButtonText: 'Register',
            buttonText: 'Login',
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                await BlocProvider.of<LoginCubit>(context).userLogin(
                  context: context,
                  auth: auth,
                  formKey: formKey,
                  emailController: email,
                  passwordController: password,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
