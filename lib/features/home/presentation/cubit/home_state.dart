part of 'home_cubit.dart';

class HomeState {
  final String email;
  final bool isLoading;
  final GlobalKey listTaskKey;
  final List<TaskModel> taskList;
  final StreamSubscription? stream;
  final PageController pageController;
  final List<TaskModel> taskListFavorite;
  final ScrollController scrollController;
  final ScrollController scrollControllerFavorite;

  const HomeState({
    required this.email,
    required this.stream,
    required this.taskList,
    required this.isLoading,
    required this.listTaskKey,
    required this.pageController,
    required this.scrollController,
    required this.taskListFavorite,
    required this.scrollControllerFavorite,
  });

  factory HomeState.init() => HomeState(
        email: "",
        stream: null,
        taskList: [],
        isLoading: false,
        taskListFavorite: [],
        listTaskKey: GlobalKey(),
        pageController: PageController(),
        scrollController: ScrollController(),
        scrollControllerFavorite: ScrollController(),
      );

  HomeState copyWith({
    String? email,
    bool? isLoading,
    List<TaskModel>? taskList,
    StreamSubscription? stream,
    List<TaskModel>? taskListFavorite,
  }) =>
      HomeState(
        listTaskKey: listTaskKey,
        email: email ?? this.email,
        stream: stream ?? this.stream,
        pageController: pageController,
        scrollController: scrollController,
        taskList: taskList ?? this.taskList,
        isLoading: isLoading ?? this.isLoading,
        scrollControllerFavorite: scrollControllerFavorite,
        taskListFavorite: taskListFavorite ?? this.taskListFavorite,
      );
}
