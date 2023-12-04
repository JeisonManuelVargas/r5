import 'package:flutter/material.dart';
import 'package:r5/injection_container.dart';
import 'package:r5/core/base/base_page.dart';
import 'package:r5/core/widget/custom_title.dart';
import 'package:r5/core/widget/custom_input.dart';
import 'package:r5/core/widget/custom_button.dart';
import 'package:r5/features/create_task/presentation/cubit/create_task_cubit.dart';

class CreateTask extends BasePage<CreateTaskState, CreateTaskCubit> {
  const CreateTask({super.key});

  @override
  CreateTaskCubit createBloc(BuildContext context) =>
      sl<CreateTaskCubit>()..init(context);

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
                    mode: Mode.dark,
                    firstTitle: "CreateTask",
                    secondTitle: "please write your data",
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
               Column(
                 children: [
                   CustomInput(
                     icon: Icons.task,
                     label: "Task Name",
                     validation: bloc.validate,
                     controller: state.nameTaskController,
                   ),
                   const SizedBox(height: 20),
                   CustomInput(
                     label: "Task Description",
                     validation: bloc.validate,
                     icon: Icons.description,
                     controller: state.descriptionController,
                   ),
                 ],
               ),
                state.isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        state: CustomButtonEnum.enable,
                        label: "Create Task",
                        onTap: () => bloc.createTaskValidate(context: context),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
