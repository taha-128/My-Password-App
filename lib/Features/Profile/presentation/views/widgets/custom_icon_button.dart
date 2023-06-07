import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key, required this.onTap, required this.iconPath, this.color});
  final void Function() onTap;
  final String iconPath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final boxShadow = [
      BoxShadow(
        offset: const Offset(0, 0),
        color: Theme.of(context).shadowColor,
        blurRadius: 20,
        spreadRadius: .4,
      )
    ];
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: boxShadow,
        ),
        child: SvgPicture.asset(
          iconPath,
          // ignore: deprecated_member_use
          color: color,
          width: width * .085,
        ),
      ),
    );
  }
}
