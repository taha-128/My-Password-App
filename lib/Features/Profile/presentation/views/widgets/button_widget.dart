import 'package:my_password/Core/utils/styles.dart';
import 'package:my_password/Core/utils/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.assetName,
    required this.text,
    required this.textColor,
    this.svgColor,
    required this.onTap,
  });
  final String assetName, text;
  final Color textColor;
  final Color? svgColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      begin: 1,
      end: .9,
      beginDuration: const Duration(milliseconds: 200),
      endDuration: const Duration(milliseconds: 300),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(bottom: 20),
        width: MediaQuery.of(context).size.width * .7,
        height: MediaQuery.of(context).size.height * .06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              assetName,
              width: 25,
            ),
            Text(
              text,
              style: Styles.textStyle20.copyWith(
                fontFamily: 'Nunito',
                color: textColor,
              ),
            ),
            SvgPicture.asset(
              Svgs.go,
              width: 25,
              // ignore: deprecated_member_use
              color: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
