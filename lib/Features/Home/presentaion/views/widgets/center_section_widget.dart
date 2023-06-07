import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:my_password/Core/utils/styles.dart';
import 'package:my_password/Features/Home/presentaion/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:my_password/Features/Home/presentaion/views/widgets/remaining_user_accounts_widget.dart';
import 'package:my_password/Features/Profile/presentation/views/widgets/account_details.dart';
import 'package:my_password/constants.dart';
import 'account_details_dialog.dart';
import 'user_account_widget.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class CenterSection extends StatelessWidget {
  const CenterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
            return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                late bool isThereError;

                Map<String, dynamic>? ref = snapshot.data?.data();
                List<dynamic>? accounts = ref?['accounts'];

                if (!snapshot.hasData) {
                  return SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: LoadingAnimationWidget.twistingDots(
                        leftDotColor: Theme.of(context).colorScheme.secondary,
                        rightDotColor: MyColors.kRed,
                        size: 80,
                      ),
                    ),
                  );
                }
                if (snapshot.data?.data()?.containsKey('accounts') == true) {
                  accounts = snapshot.data?.data()?['accounts'];
                  cubit.accounts = accounts;
                  cubit.userSpace = int.parse(snapshot.data?['user_space']);
                  isThereError = false;
                  AccountDetails.userSpace = snapshot.data?['user_space'];
                } else {
                  isThereError = true;
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RemainingUserAccountsWidget(
                      usageSpace: accounts!.length,
                      userSpace: cubit.userSpace ?? 5,
                      dataLoaded: isThereError,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Your Accounts:',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 17),
                    Expanded(
                      child: accounts.isEmpty
                          ? const Center(
                              child: Text(
                                'You don\'t have any account you can add one by click on + button',
                                textAlign: TextAlign.center,
                                style: Styles.textStyle18,
                              ),
                            )
                          : ListView.builder(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              physics: const BouncingScrollPhysics(),
                              itemCount: accounts.length,
                              itemBuilder: (context, i) {
                                final key = encrypt.Key.fromLength(32);
                                final iv = encrypt.IV.fromLength(16);

                                final encrypter =
                                    encrypt.Encrypter(encrypt.AES(key));
                                final encrypted = encrypt.Encrypted.fromBase64(
                                    accounts?[i]['password']);
                                final decrypted =
                                    encrypter.decrypt(encrypted, iv: iv);

                                return UserAccountWidget(
                                  dataLoaded: isThereError,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AccountDetialsDialog(
                                          password: decrypted,
                                          email: accounts?[i]['email'],
                                          icon: accounts?[i]['icon'],
                                          i: i,
                                        );
                                      },
                                    );
                                  },
                                  password:
                                      decrypted.replaceAll(RegExp('.'), '*'),
                                  email: accounts?[i]['email'],
                                  icon: accounts?[i]['icon'],
                                  i: i,
                                );
                              },
                            ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
