import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r5/core/model/task_model.dart';
import 'package:r5/core/navigation/navigator.dart';
import 'package:r5/core/util/custom_snack_bar.dart';
import 'package:r5/features/create_task/domain/usecases/create_task_use_case.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  final CreateTaskUseCase _createTaskUseCase;

  CreateTaskCubit({required CreateTaskUseCase createTaskUseCase})
      : _createTaskUseCase = createTaskUseCase,
        super(CreateTaskState.init());

  init(BuildContext context, String email) =>
      emit(state.copyWith(email: email));

  createTaskValidate({BuildContext? context}) {
    if (state.formKey.currentState!.validate()) {
      emit(state.copyWith(isLoading: true));
      _createTask(context: context);
    }
  }

  _createTask({BuildContext? context}) async {
    final result = await _createTaskUseCase(TaskModel(
      id: "",
      language: "es",
      creatorName: state.email,
      dateCreated: DateTime.now(),
      nameTask: state.nameTaskController.text,
      description: state.descriptionController.text,
    ));
    result.fold(
      (dynamic l) {
        if (context != null) customSnackBar(context, content: l.code);
        emit(state.copyWith(isLoading: false));
      },
      (r) {
        if (context != null) {
          customSnackBar(
            context,
            isSuccess: true,
            content: "the task was created successfully",
          );
        }
        emit(state.copyWith(isLoading: false));
        AppNavigator.pop();
      },
    );
  }

  String? validate(String? text) {
    String element = text ?? "";
    if (element.isEmpty) return "this field cannot be empty";
    return null;
  }

  goBack() => AppNavigator.pop();
}
