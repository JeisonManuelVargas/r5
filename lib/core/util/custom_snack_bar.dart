import 'package:flutter/material.dart';
import 'package:r5/core/util/app_color.dart';

ScaffoldFeatureController customSnackBar(
  BuildContext context, {
  bool isSuccess = false,
  required String content,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: isSuccess ? AppColors.second : AppColors.error,
    content: Text(
      content,
      style: const TextStyle(color: AppColors.black, letterSpacing: 0.5),
    ),
  ));
}
