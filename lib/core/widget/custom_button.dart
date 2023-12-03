import 'package:flutter/material.dart';
import 'package:r5/core/util/app_color.dart';

enum CustomButtonEnum {
  enable,
  disable,
}

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final CustomButtonEnum state;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.state = CustomButtonEnum.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(40),
      color: _generateColor(),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(40),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  Color _generateColor() {
    switch (state) {
      case CustomButtonEnum.enable:
        return AppColors.second;
      case CustomButtonEnum.disable:
        return AppColors.disable;
    }
  }
}
