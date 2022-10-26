import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'navigation_service.dart';

class NavigationServiceImpl implements NavigationService {
  @override
  Future<dynamic> pushNamed(PageRouteInfo route, BuildContext context,
      {Object? arguments}) {
    return context.router.push(route);
  }

  @override
  Future<dynamic> pushReplacementNamed(
      PageRouteInfo route, BuildContext context,
      {Object? arguments}) {
    //return navigatorKey.currentState!.pushNamed(route.routeName, arguments: arguments);

    return context.router.replace(route);
  }

  @override
  void pop(BuildContext context) {
    context.router.pop();
  }

  @override
  Future popAllAndPushNamed(PageRouteInfo route, BuildContext context,
      {Object? arguments}) {
    context.router.popUntilRoot();

    return context.router.replace(route);
  }
}
