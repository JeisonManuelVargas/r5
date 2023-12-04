import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r5/core/model/task_model.dart';
import 'package:r5/core/util/custom_snack_bar.dart';
import 'package:r5/features/home/domain/usecases/get_task_list_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTaskListUseCase _getTaskListUseCase;

  HomeCubit({
    required GetTaskListUseCase getTaskListUseCase,
  })  : _getTaskListUseCase = getTaskListUseCase,
        super(HomeState.init());

  init(BuildContext context, {required String email}) {
    getTaskList(context: context);
    emit(state.copyWith(email: email));
    state.scrollController.addListener(() => _scrollListener(context: context));
  }

  void _scrollListener({BuildContext? context}) {
    final position = state.scrollController.position;
    final isNearToFinish = position.pixels >= (position.maxScrollExtent - 100);
    if (isNearToFinish && !state.isLoading) getTaskList(context: context);
  }

  getTaskList({BuildContext? context}) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getTaskListUseCase(GetTaskListParams(
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
          taskList: state.taskList + r,
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

  void onTapCard(TaskModel task) {
  /*  bool haveTask = state.taskListFavorite.contains(task);
    if (haveTask) state.taskListFavorite.remove(task);
    if (!haveTask) state.taskListFavorite.add(task);
    emit(state.copyWith());*/
  }

  bool validateIsFavorite(TaskModel task) =>
      state.taskListFavorite.contains(task);
}
