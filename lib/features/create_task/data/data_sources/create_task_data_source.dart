import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:r5/core/errors/exceptions.dart';
import 'package:r5/core/model/task_model.dart';

abstract class CreateTaskDataSource {
  Future<bool> createTask({
    required TaskModel taskModel,
  });
}

class CreateTaskDataSourceImpl implements CreateTaskDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final String taskController = "task";

  CreateTaskDataSourceImpl({
    required this.firestore,
    required this.auth,
  });

  @override
  Future<bool> createTask({
    required TaskModel taskModel,
  }) async {
    try {
      firestore.collection(taskController).add(taskModel.toJson());
      return true;
    } on FirebaseException catch (e) {
      throw CreateTaskException(code: e.message!);
    }
  }
}
