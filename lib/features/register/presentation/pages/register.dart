import 'package:flutter/material.dart';
import 'package:r5/injection_container.dart';
import 'package:r5/core/base/base_page.dart';
import 'package:r5/core/widget/custom_title.dart';
import 'package:r5/core/widget/message_rout.dart';
import 'package:r5/core/widget/custom_input.dart';
import 'package:r5/core/widget/custom_button.dart';
import 'package:r5/features/register/presentation/cubit/register_cubit.dart';

class Register extends BasePage<RegisterState, RegisterCubit> {
  const Register({super.key});

  @override
  RegisterCubit createBloc(BuildContext context) =>
      sl<RegisterCubit>()..init(context);

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      body: Form(
        key: state.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const TitleCustom(
                    firstTitle: "Register",
                    secondTitle: "please write your data",
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
                CustomInput(
                  label: "Email",
                  icon: Icons.email_outlined,
                  validation: bloc.validateEmail,
                  controller: state.emailController,
                ),
                CustomInput(
                  label: "Phone Number",
                  validation: bloc.validatePhone,
                  icon: Icons.phone_enabled_outlined,
                  controller: state.phoneController,
                ),
                CustomInput(
                  label: "Password",
                  icon: Icons.lock_open,
                  validation: bloc.validatePassword,
                  controller: state.passwordController,
                ),
                CustomInput(
                  label: "Repeat Password",
                  icon: Icons.lock_open,
                  validation: bloc.validateResetPassword,
                  controller: state.repeatPasswordController,
                ),
                state.isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        state: CustomButtonEnum.enable,
                        label: "SIGN UP",
                        onTap: () => bloc.signUp(context: context),
                      ),
                MessageRout(
                  onTap: bloc.goBack,
                  firstLabel: "Already have a account",
                  secondLabel: "Sign in",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
