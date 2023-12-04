import 'package:flutter/cupertino.dart';
import 'package:r5/core/model/task_model.dart';
import 'package:r5/core/widget/custom_card.dart';
import 'package:r5/core/widget/custom_title.dart';

typedef IsFavorite = bool Function(TaskModel);

class CustomListView extends StatelessWidget {
  final GlobalKey? listKey;
  final IsFavorite isFavorite;
  final List<TaskModel> listTask;
  final ScrollController? controller;
  final Function(TaskModel) onTapCard;

  const CustomListView({
    Key? key,
    this.listKey,
    this.controller,
    required this.listTask,
    required this.onTapCard,
    required this.isFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listTask.isNotEmpty
        ? ListView.builder(
            key: listKey,
            controller: controller,
            itemCount: listTask.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomCard(
                onTap: () => onTapCard(listTask[index]),
                customCardModel: CustomCardModel(
                  name: listTask[index].nameTask,
                  description: listTask[index].description,
                  isFavorite: isFavorite(listTask[index]),
                ),
              ),
            ),
          )
        : Container(
            margin: const EdgeInsets.symmetric(vertical: 150),
            child: const Center(
              child: TitleCustom(
                mode: Mode.dark,
                firstTitle: "Empty list",
                secondTitle: "At this time we do not have any data",
              ),
            ),
          );
  }
}
