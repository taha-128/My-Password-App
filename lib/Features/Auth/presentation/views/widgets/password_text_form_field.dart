import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_password/Core/utils/styles.dart';
import 'package:my_password/Core/utils/svgs.dart';

import 'package:my_password/constants.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    required this.controller,
    required this.validate,
    required this.onChanged,
  });

  final TextEditingController controller;
  final Function(String?) validate;
  final Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: Styles.textStyle13.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          validator: (_) {
            return validate(_);
          },
          onChanged: onChanged('_'),
          controller: controller,
          style: Styles.textStyle15.copyWith(
            fontWeight: FontWeight.normal,
            color: const Color(0xFF000000),
          ),
          obscureText: passwordBool,
          autofocus: false,
          decoration: InputDecoration(
            hintText: '*****************',
            hintStyle: Styles.textStyle13.copyWith(
              color: Color(MyColors.darkMode ? 0xFFFFFFFF : 0xFF000000)
                  .withOpacity(.5),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 11, vertical: 16),
            filled: true,
            fillColor: MyColors.darkMode
                ? const Color(0xFF454642)
                : MyColors.kLightGrey,
            enabledBorder: border(Theme.of(context).colorScheme.secondary),
            focusedBorder: border(Theme.of(context).colorScheme.secondary),
            errorBorder: border(MyColors.kRed),
            focusedErrorBorder: border(MyColors.kRed),
            errorStyle: Styles.textStyle13,
            suffixIcon: IconButton(
              padding: const EdgeInsets.only(right: 12),
              onPressed: () {
                passwordBool = !passwordBool;
              },
              icon: SvgPicture.asset(
                passwordBool ? unshowed : showed,
                width: MediaQuery.of(context).size.width * 0.07,
                // ignore: deprecated_member_use
                color: MyColors.darkMode
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFF000000),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder border(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: color,
    ),
  );
}

//! المشكلة اني مش عارف اعمل بوليان لكل تيكست فيلد المفروض اللوجن مختلف عن الريجستير
bool passwordBool = true;
String showed = Svgs.showed;
String unshowed = Svgs.unshowed;
