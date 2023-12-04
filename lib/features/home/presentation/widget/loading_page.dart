import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const LoadingPage({
    Key? key,
    required this.child,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      isLoading ? const Center(child: CircularProgressIndicator()) : child;
}
