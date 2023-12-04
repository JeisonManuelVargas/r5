import 'package:flutter/material.dart';
import 'package:r5/core/util/app_color.dart';
import 'package:r5/injection_container.dart';
import 'package:r5/core/base/base_page.dart';
import 'package:r5/core/widget/custom_title.dart';
import 'package:r5/core/widget/message_rout.dart';
import 'package:r5/core/widget/custom_input.dart';
import 'package:r5/core/widget/custom_button.dart';
import 'package:r5/features/login/presentation/cubit/login_cubit.dart';

class Login extends BasePage<LoginState, LoginCubit> {
  const Login({super.key});

  @override
  LoginCubit createBloc(BuildContext context) =>
      sl<LoginCubit>()..init(context);

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.local_fire_department_outlined,
                  size: 200,
                  color: AppColors.second,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const TitleCustom(
                    mode: Mode.dark,
                    firstTitle: "Login",
                    secondTitle: "por favor ingrese sus credenciales",
                  ),
                ),
                CustomInput(
                  label: "Email",
                  icon: Icons.email_outlined,
                  controller: state.emailController,
                ),
                CustomInput(
                  label: "Password",
                  icon: Icons.lock_open,
                  controller: state.passwordController,
                ),
                state.isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        state: CustomButtonEnum.enable,
                        label: "LOGIN",
                        onTap: () => bloc.signIn(context: context),
                      ),
                MessageRout(
                  onTap: bloc.goToRegister,
                  firstLabel: "Don't have on account",
                  secondLabel: "Sign up",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
