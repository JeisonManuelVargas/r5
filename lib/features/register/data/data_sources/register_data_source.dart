import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:r5/core/errors/exceptions.dart';
import 'package:r5/core/model/user_model.dart';

abstract class RegisterDataSource {
  Future<UserModel?> registerWithEmailAndPassword({
    required UserModel userModel,
  });
}

class RegisterDataSourceImpl implements RegisterDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final String userController = "users";

  RegisterDataSourceImpl({
    required this.firestore,
    required this.auth,
  });

  @override
  Future<UserModel?> registerWithEmailAndPassword({
    required UserModel userModel,
  }) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );

      String id = userCredential.user!.uid;

      firestore.collection(userController).doc(id).set(userModel.toJson());

      return userModel.copyWith(id: id);
    } on FirebaseException catch (e) {
      throw RegisterException(code: e.message!);
    }
  }
}
