part of 'home_cubit.dart';

class HomeState {
  final int skip;
  final int limit;
  final String email;
  final bool isLoading;
  final GlobalKey listCoinKey;
  final List<TaskModel> taskList;
  final PageController pageController;
  final List<TaskModel> taskListFavorite;
  final ScrollController scrollController;
  final ScrollController scrollControllerFavorite;

  const HomeState({
    required this.skip,
    required this.limit,
    required this.email,
    required this.taskList,
    required this.isLoading,
    required this.listCoinKey,
    required this.pageController,
    required this.scrollController,
    required this.taskListFavorite,
    required this.scrollControllerFavorite,
  });

  factory HomeState.init() => HomeState(
        skip: 0,
        email: "",
        limit: 10,
        taskList: [],
        isLoading: false,
        taskListFavorite: [],
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
    List<TaskModel>? taskList,
    List<TaskModel>? taskListFavorite,
  }) =>
      HomeState(
        skip: skip ?? this.skip,
        listCoinKey: listCoinKey,
        limit: limit ?? this.limit,
        email: email ?? this.email,
        pageController: pageController,
        scrollController: scrollController,
        taskList: taskList ?? this.taskList,
        isLoading: isLoading ?? this.isLoading,
        scrollControllerFavorite: scrollControllerFavorite,
        taskListFavorite: taskListFavorite ?? this.taskListFavorite,
      );
}
