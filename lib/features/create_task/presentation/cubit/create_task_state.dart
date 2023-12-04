part of 'create_task_cubit.dart';

class CreateTaskState {
  final String email;
  final bool isLoading;
  final TaskModel taskModel;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameTaskController;
  final TextEditingController descriptionController;

  const CreateTaskState({
    required this.email,
    required this.formKey,
    required this.taskModel,
    required this.isLoading,
    required this.nameTaskController,
    required this.descriptionController,
  });

  factory CreateTaskState.init() => CreateTaskState(
        email: "",
        isLoading: false,
        taskModel: TaskModel.init(),
        formKey: GlobalKey<FormState>(),
        nameTaskController: TextEditingController(),
        descriptionController: TextEditingController(),
      );

  CreateTaskState copyWith({
    bool? isLoading,
    TaskModel? taskModel,
    String? email,
  }) =>
      CreateTaskState(
        formKey: formKey,
        email: email ?? this.email,
        nameTaskController: nameTaskController,
        taskModel: taskModel ?? this.taskModel,
        isLoading: isLoading ?? this.isLoading,
        descriptionController: descriptionController,
      );
}
