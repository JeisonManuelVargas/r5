import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:r5/core/errors/exceptions.dart';
import 'package:r5/core/extension/extension.dart';

import 'package:r5/core/model/coin_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeDataSource {
  Future<List<CoinModel>> getListCoin({
    required int skip,
    required int limit,
  });
}

class HomeDataSourceImpl implements HomeDataSource {
  final FirebaseFirestore db;
  final String userCollection = 'users';

  HomeDataSourceImpl({required this.db});

  @override
  Future<List<CoinModel>> getListCoin({
    required int skip,
    required int limit,
  }) async {
    try {
      Uri uri = "coins?skip=$skip&limit=$limit".stringToUri;
      final res = await http.get(uri);

      if (res.statusCode == 200) {
        final jsonData = jsonDecode(res.body);
        List listData = jsonData['coins'];
        final list = listData.map((e) => CoinModel.fromJson(e)).toList();
        return list;
      } else {
        throw HomeException(code: 'Error al cargar datos desde la API');
      }
    } catch (e) {
      throw HomeException(code: 'Error al cargar datos desde la API');
    }
  }
}
