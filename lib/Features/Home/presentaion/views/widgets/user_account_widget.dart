import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_password/Core/utils/functions.dart';

import 'package:my_password/Features/Home/presentaion/cubit/home_cubit.dart';
import 'package:my_password/Core/utils/styles.dart';
import 'package:my_password/Core/utils/svgs.dart';

import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

import 'package:flutter_svg/svg.dart';

class UserAccountWidget extends StatelessWidget {
  const UserAccountWidget({
    super.key,
    required this.onTap,
    required this.email,
    required this.password,
    required this.i,
    required this.icon,
    required this.dataLoaded,
  });
  final GestureTapCallback onTap;
  final String email, password, icon;
  final int i;
  final bool dataLoaded;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ZoomTapAnimation(
      begin: 1,
      end: .9,
      beginDuration: const Duration(milliseconds: 200),
      endDuration: const Duration(milliseconds: 300),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        height: height * 0.12,
        width: double.infinity,
        child: Material(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          elevation: 5,
          shadowColor: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(17.5),
            child: Row(
              children: [
                Container(
                  width: width * 0.15,
                  height: width * 0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/svgs/$icon.svg',
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: width * 0.4,
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: const StrutStyle(fontSize: 12.0),
                          text: TextSpan(
                            style: Styles.textStyle15.copyWith(
                              fontFamily: 'Nunito',
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            text: email,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: width * 0.4,
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: const StrutStyle(fontSize: 12.0),
                          text: TextSpan(
                            style: Styles.textStyle15.copyWith(
                              fontFamily: 'Nunito',
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            text: password,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    var cubit = BlocProvider.of<HomeCubit>(context);

                    final key = encrypt.Key.fromLength(32);
                    final iv = encrypt.IV.fromLength(16);

                    final encrypter = encrypt.Encrypter(encrypt.AES(key));
                    final encrypted = encrypt.Encrypted.fromBase64(
                        cubit.accounts?[i]['password']);

                    final decrypted = encrypter.decrypt(encrypted, iv: iv);
                    Clipboard.setData(
                      ClipboardData(
                        text:
                            'Email: ${cubit.accounts![i]['email']}\nPassword: $decrypted\nصل على الحبيب اللهم صل وسلم وبارك على سيدنا محمد ❤️',
                      ),
                    );
                    Functions.successToast(context, 'Copy Successed',
                        'Copy successed now check your clipboard');
                  },
                  child: SvgPicture.asset(
                    Svgs.copy,
                    // ignore: deprecated_member_use
                    color: const Color(0xFFC4ACA6),
                    width: width * .05,
                    height: height * .05,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
