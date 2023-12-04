import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:r5/core/animations/fade_page_route.dart';
import 'package:r5/features/create_task/presentation/pages/create_task.dart';
import 'package:r5/features/home/presentation/pages/home.dart';
import 'package:r5/features/login/presentation/pages/login.dart';
import 'package:r5/features/register/presentation/pages/register.dart';

enum Routes {
  HOME,
  LOGIN,
  SPLASH,
  REGISTER,
  CREATE_TASK,
}

class _Page {
  static const String home = '/home';
  static const String login = '/login';
  static const String splash = '/splash';
  static const String register = '/register';
  static const String createTask = '/createTask';

  static const Map<Routes, String> _pageMap = {
    Routes.HOME: home,
    Routes.LOGIN: login,
    Routes.SPLASH: splash,
    Routes.REGISTER: register,
    Routes.CREATE_TASK: createTask,
  };

  static String? page(Routes routes) => _pageMap[routes];
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static NavigatorState get state => navigatorKey.currentState!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    String email = '';

    dynamic argument = settings.arguments;

    if (argument is String) email = argument;

    switch (settings.name) {
      case _Page.home:
        return _pageRoute(page: Home(email: email), settings: settings);
      case _Page.login:
        return _pageRoute(page: const Login(), settings: settings);
      case _Page.register:
        return _pageRoute(page: const Register(), settings: settings);
      case _Page.createTask:
        return _pageRoute(page: const CreateTask(), settings: settings);
      default:
        return _pageRoute(page: const Login(), settings: settings);
    }
  }

  static Route _pageRoute({
    required Widget page,
    Duration? transitionDuration,
    RouteSettings? settings,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute<Route>(
      settings: settings,
      builder: (context) => page,
    )
        : FadeRoute(
      page: page,
      routeSettings: settings,
      transitionDuration: transitionDuration,
    ) as Route;
  }

  static Future push<T>(
      Routes route, {
        Object? arguments,
        Function(dynamic)? callBack,
      }) =>
      state.pushNamed(_Page.page(route)!, arguments: arguments).then(
            (value) => callBack != null ? callBack(value) : {},
      );

  static Future pushNamedAndRemoveUntil(Routes route, {Object? arguments}) =>
      state.pushNamedAndRemoveUntil(
        _Page.page(route)!,
            (Route routes) => false,
        arguments: arguments,
      );

  static void pop({Object? params}) => state.pop(params);

  static void popUntil(Routes route) => state.popUntil(
        (routes) => routes.settings.name == _Page.page(route)!,
  );
}
