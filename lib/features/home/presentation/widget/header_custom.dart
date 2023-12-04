import 'package:flutter/material.dart';
import 'package:r5/core/util/app_color.dart';
import 'package:r5/core/widget/custom_title.dart';

class HeaderCustom extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function(String) onTap;

  const HeaderCustom({
    Key? key,
    required this.title,
    required this.onTap,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: AppColors.second,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 50,
              left: 50,
              right: 50,
            ),
            alignment: Alignment.centerLeft,
            child: TitleCustom(
              firstTitle: title,
              secondTitle: subTitle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _generateTextButton(label: "All List"),
              _generateTextButton(label: "Favorite List")
            ],
          )
        ],
      ),
    );
  }

  _generateTextButton({required String label}) => Expanded(
        child: InkWell(
          onTap: () => onTap(label),
          splashColor: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    color: AppColors.primary,
                    offset: Offset(1, 1),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
