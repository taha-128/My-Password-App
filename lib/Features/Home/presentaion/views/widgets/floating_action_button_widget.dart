import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_password/Core/utils/svgs.dart';
import 'package:my_password/constants.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
    required this.onTap,
  });

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width * .17,
        height: width * .17,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 0),
              spreadRadius: 1,
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
            colors: [
              MyColors.kGreen,
              MyColors.kGreen.withOpacity(0.9),
              const Color.fromARGB(0, 4, 180, 4).withOpacity(0.7),
              Colors.black.withOpacity(0.6),
              const Color.fromARGB(0, 4, 107, 180).withOpacity(0.7),
              MyColors.kCyan.withOpacity(0.9),
              MyColors.kCyan,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SvgPicture.asset(
          Svgs.add,
          // ignore: deprecated_member_use
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
