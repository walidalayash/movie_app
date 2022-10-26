import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/services/navigation/navigation_service.dart';
import '../../../../locator.dart';
import '../../../core/models/token/token.dart';
import '../../../core/repositories/token_repository/token_repository.dart';
import '../../router.gr.dart';

class LoginViewModel extends BaseViewModel {
  BuildContext? context;
  Token? token;
  Future<void> moveToMovieViewRoute(BuildContext context) async {
    await locator<NavigationService>()
        .pushNamed(CustomerMainViewRoute(), context);
  }

  Future<void> moveToSignUpRoute(BuildContext context) async {
    await locator<NavigationService>().pushNamed(SignUpRoute(), context);
  }

  Future<void> init(BuildContext context) async {
    this.context = context;
    print('123456789');

    setBusy(true);
    // token =
    //     await locator<TokenRepository>().fetchToken({'paginate': '1000000'});
    // print(token!.token);
    setBusy(false);
  }
}
