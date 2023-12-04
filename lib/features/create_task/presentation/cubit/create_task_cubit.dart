import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r5/core/extension/extension.dart';
import 'package:r5/core/model/user_model.dart';
import 'package:r5/core/navigation/navigator.dart';
import 'package:r5/core/util/custom_snack_bar.dart';
import 'package:r5/features/create_task/domain/usecases/create_task_use_case.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  final CreateTaskUseCase _registerUseCase;

  CreateTaskCubit({required CreateTaskUseCase registerUseCase})
      : _registerUseCase = registerUseCase,
        super(CreateTaskState.init());

  init(BuildContext context) {}

  signUp({BuildContext? context}) {
    if (state.formKey.currentState!.validate()) {
      UserModel userModel = state.userModel.copyWith(
        phone: state.phoneController.text,
        email: state.emailController.text,
        password: state.passwordController.text,
      );
      emit(state.copyWith(isLoading: true, userModel: userModel));
      _signUp(context: context);
    }
  }

  _signUp({BuildContext? context}) async {
    final result = await _registerUseCase(state.userModel);
    result.fold(
      (dynamic l) {
        if(context != null) customSnackBar(context, content: l.code);
        emit(state.copyWith(isLoading: false));
      },
      (r) {
        if(context != null) customSnackBar(context, isSuccess: true, content: "the user was created successfully");
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  String? validateEmail(String? text) {
    String element = text ?? "";
    if (element.isEmpty) return "this field cannot be empty";
    if (!element.isEmail) return "invalid mail";
    return null;
  }

  String? validatePhone(String? text) {
    String element = text ?? "";
    if (element.isEmpty) return "this field cannot be empty";
    if (!element.isPhoneValid) return "invalid phone";
    return null;
  }

  String? validatePassword(String? text) {
    String element = text ?? "";
    if (element.isEmpty) return "this field cannot be empty";
    if (!element.isPasswordValid) return "invalid password";
    return null;
  }

  String? validateResetPassword(String? text) {
    String element = text ?? "";
    if (element.isEmpty) return "this field cannot be empty";
    if (!element.isPasswordValid) return "invalid password";
    if (!element.contains(state.passwordController.text))
      return "password is not same";
    return null;
  }

  goBack() => AppNavigator.pop();
}
