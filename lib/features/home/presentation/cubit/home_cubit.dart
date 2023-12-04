import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r5/core/model/coin_model.dart';
import 'package:r5/core/util/custom_snack_bar.dart';
import 'package:r5/features/home/domain/usecases/get_coin_list_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCoinListUseCase _getCoinListUseCase;

  HomeCubit({
    required GetCoinListUseCase getCoinListUseCase,
  })  : _getCoinListUseCase = getCoinListUseCase,
        super(HomeState.init());

  init(BuildContext context, {required String email}) {
    getCoinList(context: context);
    emit(state.copyWith(email: email));
    state.scrollController.addListener(() => _scrollListener(context: context));
  }

  void _scrollListener({BuildContext? context}) {
    final position = state.scrollController.position;
    final isNearToFinish = position.pixels >= (position.maxScrollExtent - 100);
    if (isNearToFinish && !state.isLoading) getCoinList(context: context);
  }

  getCoinList({BuildContext? context}) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getCoinListUseCase(GetCoinListParams(
      skip: state.skip,
      limit: state.limit,
    ));
    result.fold(
      (dynamic l) {
        emit(state.copyWith(isLoading: false));
        if(context != null) customSnackBar(context, content: l.code);
      },
      (r) async {
        emit(state.copyWith(
          isLoading: false,
          skip: state.limit,
          limit: state.limit + 10,
          coinList: state.coinList + r,
        ));
      },
    );
  }

  void changeListView(String key) {
    if (key == "All List") {
      state.pageController.animateToPage(
        0,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 400),
      );
    }
    if (key == "Favorite List") {
      state.pageController.animateToPage(
        1,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 400),
      );
    }
  }

  void onTapCard(CoinModel coin) {
    bool haveCoin = state.coinListFavorite.contains(coin);
    if (haveCoin) state.coinListFavorite.remove(coin);
    if (!haveCoin) state.coinListFavorite.add(coin);
    emit(state.copyWith());
  }

  bool validateIsFavorite(CoinModel coin) =>
      state.coinListFavorite.contains(coin);
}
