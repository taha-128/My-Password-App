import 'package:flutter/material.dart';
import 'login_form_widget.dart';
import 'login_upper_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LoginUpperSection(),
              SizedBox(height: 95),
              LoginFormWidget()
            ],
          ),
        ),
      ),
    );
  }
}
