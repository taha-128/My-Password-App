import 'package:flutter/material.dart';
import 'package:my_password/Features/Auth/presentation/views/widgets/register_form_widget.dart';
import 'register_upper_section.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            RegsiterUpperSection(),
            SizedBox(height: 55),
            RegisterFormWidget(),
          ],
        ),
      ),
    );
  }
}
