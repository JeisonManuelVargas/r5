import 'package:flutter/cupertino.dart';

enum FromAnimation {
  fromLeft,
  fromRight,
  fromDown,
  fromUp,
}

class CustomAnimateContainer extends StatelessWidget {
  const CustomAnimateContainer({
    super.key,
    this.afterFinished,
    required this.child,
    this.startNow = true,
    this.fromAnimation = FromAnimation.fromDown,
    this.duration = const Duration(milliseconds: 700),
  });

  final Widget child;
  final bool startNow;
  final Duration duration;
  final Function()? afterFinished;
  final FromAnimation fromAnimation;

  @override
  Widget build(BuildContext context) {
    return startNow
        ? TweenAnimationBuilder<double>(
            child: child,
            duration: duration,
            onEnd: afterFinished,
            tween: Tween(begin: 1, end: 0),
            builder: (context, value, childBuild) => Transform.translate(
              offset: Offset(
                _generateFromAnimation(fromAnimation, value).dx,
                _generateFromAnimation(fromAnimation, value).dy,
              ),
              child: Opacity(opacity: (value - 1) * -1, child: childBuild),
            ),
          )
        : Opacity(opacity: 0, child: child);
  }
}

XYModel _generateFromAnimation(FromAnimation from, double value) {
  switch (from) {
    case FromAnimation.fromLeft:
      return XYModel(dx: -50 * value, dy: 0);
    case FromAnimation.fromRight:
      return XYModel(dx: 50 * value, dy: 0);
    case FromAnimation.fromDown:
      return XYModel(dx: 0, dy: 50 * value);
    case FromAnimation.fromUp:
      return XYModel(dx: 0, dy: -50 * value);
  }
}

class XYModel {
  const XYModel({
    required this.dx,
    required this.dy,
  });

  final double dx;
  final double dy;
}
