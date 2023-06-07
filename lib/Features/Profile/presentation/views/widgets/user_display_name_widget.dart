import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDisplayNameWidget extends StatelessWidget {
  const UserDisplayNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      child: Text(
        FirebaseAuth.instance.currentUser!.displayName!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 35,
          fontFamily: 'Nunito',
          overflow: TextOverflow.ellipsis,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
