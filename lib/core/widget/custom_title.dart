import 'package:flutter/cupertino.dart';
import 'package:r5/core/util/app_color.dart';

enum Mode { light, dark }

class TitleCustom extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final CrossAxisAlignment? crossAxisAlignment;
  final Mode mode;

  const TitleCustom(
      {Key? key,
      this.crossAxisAlignment,
      required this.firstTitle,
      required this.secondTitle,
      this.mode = Mode.light})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Text(
          firstTitle,
          style: TextStyle(
            fontSize: 27,
            color: _generatePrincipalMode(mode),
            fontWeight: FontWeight.w800,
            shadows: [
              Shadow(
                color: _generateSecondaryMode(mode),
                offset: const Offset(1, 1),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          secondTitle,
          style: TextStyle(
            fontSize: 15,
            color: _generatePrincipalMode(mode),
            fontWeight: FontWeight.w300,
            shadows: [
              Shadow(
                color: _generateSecondaryMode(mode),
                offset: const Offset(1, 1),
              )
            ],
          ),
        ),
      ],
    );
  }

  Color _generatePrincipalMode(Mode mode) {
    switch (mode) {
      case Mode.light:
        return AppColors.primary;

      case Mode.dark:
        return AppColors.black;
    }
  }

  Color _generateSecondaryMode(Mode mode) {
    switch (mode) {
      case Mode.light:
        return AppColors.black;

      case Mode.dark:
        return AppColors.disable;
    }
  }
}
