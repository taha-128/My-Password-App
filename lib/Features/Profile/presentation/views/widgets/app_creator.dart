import 'package:flutter/material.dart';
import 'package:my_password/Core/utils/functions.dart';
import 'package:my_password/Core/utils/styles.dart';
import 'package:my_password/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AppCreator extends StatelessWidget {
  const AppCreator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ZoomTapAnimation(
            child: Text(
              'The Creator of This App',
              style:
                  Styles.textStyle30.copyWith(color: ProfileViewColors.kPink),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          ZoomTapAnimation(
            child: Text(
              'Taha Hassan',
              style:
                  Styles.textStyle30.copyWith(color: ProfileViewColors.kLime),
            ),
          ),
          const SizedBox(height: 20),
          ZoomTapAnimation(
            child: Text(
              '+201033527637',
              style:
                  Styles.textStyle30.copyWith(color: ProfileViewColors.kPurple),
            ),
          ),
          const SizedBox(height: 20),
          ZoomTapAnimation(
            onTap: () async {
              await navigateToMyPage(context);
            },
            child: Text(
              'Go to my Facebook page',
              style: Styles.textStyle30.copyWith(color: MyColors.kYellow),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> navigateToMyPage(BuildContext context) async {
  String link = 'https://www.facebook.com/profile.php?id=100055747885038';
  Uri url = Uri.parse(link);
  try {
    launchUrl(url,mode: LaunchMode.externalNonBrowserApplication);
  } on Exception catch (_) {
    if (context.mounted) {
      Functions.warning(
          context, 'There is an error', 'There is an error, please try again');
    }
  }
}
