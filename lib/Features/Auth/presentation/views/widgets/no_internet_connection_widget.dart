import 'package:flutter/material.dart';
import 'package:my_password/Core/utils/styles.dart';
import 'package:my_password/constants.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  const NoInternetConnectionWidget({super.key, this.onPresesd});
  final GestureTapCallback? onPresesd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: boxDecoration2,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/internet.png',
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .065,
                width: MediaQuery.of(context).size.width * .6,
                decoration: boxDecoration1,
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: MaterialButton(
                    splashColor: MyColors.kRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: onPresesd,
                    child: Text(
                      'تحقق من الاتصال',
                      style: Styles.textStyle20.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

var boxDecoration1 = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: MyColors.kYellow,
      offset: const Offset(0, 0),
      blurRadius: 90,
      spreadRadius: 0.4,
    ),
  ],
  color: MyColors.kYellow,
  borderRadius: BorderRadius.circular(15),
);
var boxDecoration2 = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      MyColors.kCyan,
      MyColors.kPurple,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.center,
  ),
);
