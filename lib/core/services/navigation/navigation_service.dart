import 'package:auto_route/auto_route.dart';
import 'package:flutter/src/widgets/framework.dart';

/// Service that is responsible for navigating around the app
abstract class NavigationService {
  Future<dynamic> pushNamed(PageRouteInfo route, BuildContext context,
      {Object? arguments});

  Future<dynamic> pushReplacementNamed(
      PageRouteInfo route, BuildContext context,
      {Object? arguments});

  Future<dynamic> popAllAndPushNamed(PageRouteInfo route, BuildContext context,
      {Object? arguments});

  void pop(BuildContext context);
}
