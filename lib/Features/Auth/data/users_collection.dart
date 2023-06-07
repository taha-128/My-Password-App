import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addUser(
    {required String displayName,
    required String email,
    required String docId,
    required bool isActive}) async {
  var ref = FirebaseFirestore.instance;
  ref.collection('users').doc(docId).set(
    {
      'display_name': displayName,
      'isActivated': isActive,
      'user_space': '10',
      'email': email,
      'accounts': [],
    },
  );
}
