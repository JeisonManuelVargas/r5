part of 'home_cubit.dart';

class HomeState {
  final int skip;
  final int limit;
  final String email;
  final bool isLoading;
  final GlobalKey listCoinKey;
  final List<CoinModel> coinList;
  final PageController pageController;
  final List<CoinModel> coinListFavorite;
  final ScrollController scrollController;
  final ScrollController scrollControllerFavorite;

  const HomeState({
    required this.skip,
    required this.limit,
    required this.email,
    required this.coinList,
    required this.isLoading,
    required this.listCoinKey,
    required this.pageController,
    required this.scrollController,
    required this.coinListFavorite,
    required this.scrollControllerFavorite,
  });

  factory HomeState.init() => HomeState(
        skip: 0,
        email: "",
        limit: 10,
        coinList: [],
        isLoading: false,
        coinListFavorite: [],
        listCoinKey: GlobalKey(),
        pageController: PageController(),
        scrollController: ScrollController(),
        scrollControllerFavorite: ScrollController(),
      );

  HomeState copyWith({
    int? skip,
    int? limit,
    String? email,
    bool? isLoading,
    List<CoinModel>? coinList,
    List<CoinModel>? coinListFavorite,
  }) =>
      HomeState(
        skip: skip ?? this.skip,
        listCoinKey: listCoinKey,
        limit: limit ?? this.limit,
        email: email ?? this.email,
        pageController: pageController,
        scrollController: scrollController,
        coinList: coinList ?? this.coinList,
        isLoading: isLoading ?? this.isLoading,
        scrollControllerFavorite: scrollControllerFavorite,
        coinListFavorite: coinListFavorite ?? this.coinListFavorite,
      );
}
