import 'package:flutter/cupertino.dart';
import 'package:r5/core/util/app_color.dart';

class TitleCustom extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final CrossAxisAlignment? crossAxisAlignment;

  const TitleCustom({
    Key? key,
    this.crossAxisAlignment,
    required this.firstTitle,
    required this.secondTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Text(
          firstTitle,
          style: const TextStyle(
            fontSize: 25,
            color: AppColors.white,
            fontWeight: FontWeight.w800,
            shadows: [
              Shadow(
                color: AppColors.primary,
                offset: Offset(1, 1),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          secondTitle,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.disable,
            fontWeight: FontWeight.w300,
            shadows: [
              Shadow(
                color: AppColors.primary,
                offset: Offset(1, 1),
              )
            ],
          ),
        ),
      ],
    );
  }
}
