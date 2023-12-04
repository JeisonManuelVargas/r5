import 'package:dartz/dartz.dart';
import 'package:r5/core/errors/failure.dart';
import 'package:r5/core/model/coin_model.dart';
import 'package:r5/core/base/base_usecase.dart';
import 'package:r5/features/home/domain/repositories/home_auth_repository.dart';

class GetCoinListUseCase extends BaseUseCase<List<CoinModel>, GetCoinListParams> {
  GetCoinListUseCase({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<CoinModel>>> call(GetCoinListParams params) =>
      homeRepository.getListCoin(
        skip: params.skip,
        limit: params.limit,
      );
}

class GetCoinListParams {
  GetCoinListParams({
    required this.limit,
    required this.skip,
  });

  final int limit;
  final int skip;
}
