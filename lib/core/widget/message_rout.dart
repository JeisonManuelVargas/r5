import 'package:flutter/material.dart';
import 'package:r5/core/util/app_color.dart';

class MessageRout extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final Function() onTap;

  const MessageRout({
    Key? key,
    required this.onTap,
    required this.firstLabel,
    required this.secondLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstLabel,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(width: 3),
        InkWell(
          onTap: onTap,
          child: Text(
            secondLabel,
            style: const TextStyle(
              color: AppColors.second,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
