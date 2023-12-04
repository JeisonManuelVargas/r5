import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/model/coin_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CoinModel>>> getListCoin({
    required int limit,
    required int skip,
  });
}
