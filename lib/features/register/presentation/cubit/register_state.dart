part of 'register_cubit.dart';

class RegisterState {
  final bool isLoading;
  final UserModel userModel;
  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController repeatPasswordController;

  const RegisterState({
    required this.formKey,
    required this.userModel,
    required this.isLoading,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.repeatPasswordController,
  });

  factory RegisterState.init() => RegisterState(
        isLoading: false,
        userModel: UserModel.init(),
        formKey: GlobalKey<FormState>(),
        phoneController: TextEditingController(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        repeatPasswordController: TextEditingController(),
      );

  RegisterState copyWith({
    bool? isLoading,
    UserModel? userModel,
  }) =>
      RegisterState(
        formKey: formKey,
        emailController: emailController,
        phoneController: phoneController,
        userModel: userModel ?? this.userModel,
        isLoading: isLoading ?? this.isLoading,
        passwordController: passwordController,
        repeatPasswordController: repeatPasswordController,
      );
}
