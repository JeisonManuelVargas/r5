import 'package:flutter/material.dart';
import 'package:r5/core/widget/custom_button.dart';
import 'package:r5/injection_container.dart';
import 'package:r5/core/base/base_page.dart';
import 'package:r5/features/home/presentation/cubit/home_cubit.dart';
import 'package:r5/features/home/presentation/widget/loading_page.dart';
import 'package:r5/features/home/presentation/widget/header_custom.dart';
import 'package:r5/features/home/presentation/widget/custom_list_view.dart';

class Home extends BasePage<HomeState, HomeCubit> {
  final String email;

  const Home({
    super.key,
    required this.email,
  });

  @override
  HomeCubit createBloc(BuildContext context) => sl<HomeCubit>()
    ..init(
      context,
      email: email,
    );

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderCustom(
                title: "Welcome",
                subTitle: state.email,
                onTap: bloc.changeListView,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: LoadingPage(
                  isLoading: state.isLoading,
                  child: PageView(
                    controller: state.pageController,
                    children: [
                      CustomListView(
                        key: state.listCoinKey,
                        listTask: state.taskList,
                        onTapCard: bloc.onTapCard,
                        controller: state.scrollController,
                        isFavorite: bloc.validateIsFavorite,
                      ),
                      CustomListView(
                        onTapCard: bloc.onTapCard,
                        listTask: state.taskListFavorite,
                        isFavorite: bloc.validateIsFavorite,
                        controller: state.scrollControllerFavorite,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03,
                ),
                child: CustomButton(
                  label: "Create Task",
                  onTap: bloc.goToCreateTask,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
