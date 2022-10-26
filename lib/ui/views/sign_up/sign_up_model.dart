import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/services/navigation/navigation_service.dart';
import '../../../../locator.dart';
import '../../router.gr.dart';

class SignUpModel extends BaseViewModel {
  Future<void> moveToMovieViewRoute(BuildContext context) async {
    await locator<NavigationService>()
        .pushNamed(CustomerMainViewRoute(), context);
  }

  Future<void> moveToLoginViewRoute(BuildContext context) async {
    await locator<NavigationService>().pushNamed(LoginScreenRoute(), context);
  }
}
