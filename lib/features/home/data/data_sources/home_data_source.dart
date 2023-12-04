import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeDataSource {
  Future<Stream<QuerySnapshot>> getListTask();
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore db;
  final String userCollection = 'users';

  HomeDataSourceImpl({required this.db});

  @override
  Future<Stream<QuerySnapshot>> getListTask() async {
    return db.collection("task").snapshots();
  }
}
