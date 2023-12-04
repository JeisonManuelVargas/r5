part of 'create_task_cubit.dart';

class CreateTaskState {
  final bool isLoading;
  final UserModel userModel;
  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;

  const CreateTaskState({
    required this.formKey,
    required this.userModel,
    required this.isLoading,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.repeatPasswordController,
  });

  factory CreateTaskState.init() => CreateTaskState(
        isLoading: false,
        userModel: UserModel.init(),
        formKey: GlobalKey<FormState>(),
        phoneController: TextEditingController(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        repeatPasswordController: TextEditingController(),
      );

  CreateTaskState copyWith({
    bool? isLoading,
    UserModel? userModel,
  }) =>
      CreateTaskState(
        formKey: formKey,
        emailController: emailController,
        phoneController: phoneController,
        userModel: userModel ?? this.userModel,
        isLoading: isLoading ?? this.isLoading,
        passwordController: passwordController,
        repeatPasswordController: repeatPasswordController,
      );
}
