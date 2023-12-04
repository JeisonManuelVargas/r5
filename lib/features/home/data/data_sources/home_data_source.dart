import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:r5/core/model/task_model.dart';

abstract class HomeDataSource {
  Future<List<TaskModel>> getListTask({
    required int skip,
    required int limit,
  });
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore db;
  final String userCollection = 'users';

  HomeDataSourceImpl({required this.db});

  @override
  Future<List<TaskModel>> getListTask({
    required int skip,
    required int limit,
  }) async {
  return [];
  }
}
