import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:r5/core/errors/exceptions.dart';
import 'package:r5/core/model/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class LoginDataSourceImpl implements LoginDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore db;
  final String userCollection = 'users';

  LoginDataSourceImpl({
    required this.db,
    required this.auth,
  });

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;

      final result = await db.collection(userCollection).doc(user!.uid).get();
      return UserModel.fromJson(result.data()!, result.id);
    } on FirebaseAuthException catch (e) {
      throw LoginException(code: e.message!);
    }
  }
}
