import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_password/Core/utils/styles.dart';
import 'package:my_password/constants.dart';

class AuthButton extends StatefulWidget {
  const AuthButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.textButtonText,
      required this.view,
      required this.text,
      this.controller});
  final GestureTapCallback onPressed;
  final TextEditingController? controller;
  final String buttonText, textButtonText, text, view;

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.54,
          decoration: boxDecoration,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: widget.onPressed,
            child: Text(
              widget.buttonText,
              style: Styles.textStyle20,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.text} ',
              style: Styles.textStyle13.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (widget.controller != null) {
                  widget.controller!.clear();
                }
                GoRouter.of(context).pushReplacementNamed(widget.view);
              },
              child: Text(
                widget.textButtonText,
                style: Styles.textStyle13.copyWith(color: MyColors.kBlue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

var boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(
    colors: [
      MyColors.kCyan,
      MyColors.kGreen,
    ],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  ),
);
