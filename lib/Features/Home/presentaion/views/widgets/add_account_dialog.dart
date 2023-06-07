import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_password/Features/Home/data/account_types.dart';
import 'package:my_password/Features/Home/presentaion/cubit/home_cubit.dart';
import 'package:my_password/constants.dart';
import 'package:select_form_field/select_form_field.dart';
import '../../../../../Core/utils/styles.dart';
import 'dialog_button.dart';
import 'my_custom_text_field.dart';

class AddAccountDialog extends StatelessWidget {
  const AddAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    String? icon;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 400,
        decoration: myDecoration(
          colors: [
            MyColors.kYellow,
            const Color(0xFF958290),
            MyColors.kBlue,
          ],
          borderRadius: 30,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyCustomTextField(
                controller: email,
                fieldName: 'Email',
                hintText: 'Your email',
              ),
              const SizedBox(height: 16),
              MyCustomTextField(
                controller: password,
                fieldName: 'Password',
                hintText: 'Your password',
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 40,
                width: 200,
                child: SelectFormField(
                  decoration: inputDecoration,
                  type: SelectFormFieldType.dropdown,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle20.copyWith(color: Colors.black),
                  items: items,
                  onChanged: (val) {
                    icon = val;
                  },
                ),
              ),
              const SizedBox(height: 32),
              DialogButton(
                onPressed: () {
                  HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
                  if (formKey.currentState!.validate()) {
                    cubit.addAcc(
                      email: email.text,
                      password: password.text,
                      icon: icon ?? 'google',
                      c: context,
                    );
                  }
                },
                text: 'Add',
                begin: const Color(0xFF50AF3E),
                end: MyColors.kGreen,
                splashColor: const Color.fromARGB(255, 114, 239, 179),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

var inputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
  fillColor: Colors.lime,
  hintText: 'Select account type',
  hintStyle: Styles.textStyle18.copyWith(color: Colors.black),
  filled: true,
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: outlineInputBorder,
);
